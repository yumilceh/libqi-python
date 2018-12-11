/*
**  Copyright (C) 2013 Aldebaran Robotics
**  See COPYING for the license
*/
#include <qipython/pysignal.hpp>
#include <boost/python.hpp>
#include <boost/python/raw_function.hpp>
#include <qi/signal.hpp>
#include <qi/anyobject.hpp>
#include <qi/periodictask.hpp>
#include <qipython/gil.hpp>
#include <qipython/error.hpp>
#include <qipython/pyfuture.hpp>
#include <qipython/pyobject.hpp>
#include <qipython/pythreadsafeobject.hpp>
#include "pystrand.hpp"

qiLogCategory("py.async");

namespace qi { namespace py {

    static void pyPeriodicCb(const PyThreadSafeObject& callable) {
      GILScopedLock _gil;
      PY_CATCH_ERROR(callable.object()());
    }

    class PyPeriodicTask : public qi::PeriodicTask {
    public:
      void setCallback(boost::python::object callable) {
        if (!PyCallable_Check(callable.ptr()))
          throw std::runtime_error("Not a callable");
        qi::PeriodicTask::setCallback(boost::bind<void>(pyPeriodicCb, PyThreadSafeObject(callable)));
        qi::PeriodicTask::setStrand(extractStrandFromCallable(callable));
      }

      void stop() {
        qi::py::GILScopedUnlock _unlock;
        //unlock because stop wait for the callback to finish.
        qi::PeriodicTask::stop();
      }

      void start(bool immediate) {
        qi::py::GILScopedUnlock _unlock;
        //unlock because stop wait for the callback to finish.
        qi::PeriodicTask::start(immediate);
      }

    };

    static AnyValue pyAsync(PyThreadSafeObject safeargs) {
      GILScopedLock _gil;

      boost::python::list args(safeargs.object());
      boost::python::object callable = args[0];

      args.pop(0);

      try {
        return AnyValue::from(boost::python::object(
              callable(*boost::python::tuple(args))));
      } catch (const boost::python::error_already_set &) {
        throw std::runtime_error(PyFormatError());
      }
    }

    static boost::python::object pyasyncParamShrinker(boost::python::tuple args, boost::python::dict kwargs) {
      //arg0 always exists
      //check args[0] is a callable
      boost::python::object callable = args[0];
      if (!PyCallable_Check(callable.ptr()))
        throw std::runtime_error("Not a callable");

      qi::uint64_t delay = boost::python::extract<qi::uint64_t>(kwargs.get("delay", 0));

      // use AnyValue to ensure that GIL is acquired upon destruction. The
      // PyFuture may *not* be the last destroyed pointer!
      // We could use PyThreadSafeObject, but it is not bound to qitype so
      // AnyValue is easier to use
      boost::function<AnyValue()> f = boost::bind(&pyAsync, PyThreadSafeObject(args));

      // If there is a strand attached to that callable, we use it but we cannot use asyncDelay (we
      // use defer instead). This is because we might be executing this function from inside the
      // strand execution context, and thus asyncDelay might be blocking.
      qi::Promise<AnyValue> prom;
      qi::Strand* strand = extractStrandFromCallable(callable);
      if (strand)
      {
        strand->defer([=]() mutable { prom.setValue(f()); }, qi::MicroSeconds(delay))
          .connect([=](qi::Future<void> fut) mutable {
              if (fut.hasError())
                prom.setError(fut.error());
              else if (fut.isCanceled())
                prom.setCanceled();
            });
      }
      else
        qi::adaptFuture(qi::getEventLoop()->asyncDelay(f, qi::MicroSeconds(delay)), prom);

      return boost::python::object(qi::py::toPyFuture(prom.future()));
    }


    void export_pyasync() {
      boost::python::object async = boost::python::raw_function(&pyasyncParamShrinker, 1);

      async.attr("__doc__") = "async(callback [, delay=usec] [, arg1, ..., argn]) -> future\n"
                              ":param callback: the callback that will be called\n"
                              ":param delay: an optional delay in microseconds\n"
                              ":return: a future with the return value of the function\n"
                              "\n";

      boost::python::def("async", async);

      boost::python::class_<PyPeriodicTask, boost::shared_ptr<PyPeriodicTask>, boost::noncopyable >("PeriodicTask")
        .def(boost::python::init<>())
        .def("setCallback", &PyPeriodicTask::setCallback,
             "setCallback(callable)\n"
             ":param callable: a python callable, could be a method or a function\n"
             "\n"
             "set the callback used by the periodictask, this function can only be called once")
        .def("setUsPeriod", &PyPeriodicTask::setUsPeriod,
             "setUsPeriod(usPeriod)\n"
             ":param usPeriod: the period in microseconds\n"
             "\n"
             "Set the call interval in microseconds.\n"
             "This call will wait until next callback invocation to apply the change.\n"
             "To apply the change immediately, use: \n"
             "\n"
             ".. code-block:: python\n"
             "\n"
             "   task.stop()\n"
             "   task.setUsPeriod()\n"
             "   task.start()\n"
             "\n")
        .def("start", &PyPeriodicTask::start,
             "start(immediate)\n"
             ":param immediate: immediate if true, first schedule of the task will happen with no delay.\n"
             "\n"
             "start the periodic task at specified period. No effect if already running\n"
             "\n"
             ".. warning::\n"
             "   concurrent calls to start() and stop() will result in undefined behavior."
             "\n")
        .def("stop", &PyPeriodicTask::stop,
             "stop()\n"
             "Stop the periodic task. When this function returns, the callback will not be called anymore.\n"
             "Can be called from within the callback function\n"
             "\n"
             ".. warning::\n"
             "   concurrent calls to start() and stop() will result in undefined behavior."
             "\n")
        .def("asyncStop", &PyPeriodicTask::asyncStop,
             "asyncStop()\n"
             "Can be called from within the callback function\n"
             "Request for periodic task to stop asynchronously")
        .def("compensateCallbackTime", &PyPeriodicTask::compensateCallbackTime,
             "compensateCallbackTime(compensate)\n"
             ":param compensate: boolean. True to activate the compensation.\n"
             "\n"
             "When compensation is activated, call interval will take into account call duration to maintain the period.\n"
             "\n"
             ".. warning::\n"
             "  when the callback is longer than the period specified, compensation will result in\n"
             "  the callback being called successively without pause"
             "\n")
        .def("setName", &PyPeriodicTask::setName,
             "setName(name)\n"
             "Set name for debugging and tracking purpose")
        .def("isRunning", &PyPeriodicTask::isRunning,
             "isRunning() -> bool\n"
             ":return: true if task is running\n")
        .def("isStopping", &PyPeriodicTask::isStopping,
             "isStopping() -> bool\n"
             ":return: whether state is stopping or stopped.\n"
             "\n"
             "Can be called from within the callback to know if stop() or asyncStop()  was called.")
          ;
    }

  }
}
