This is a recipe to compile aldebaran's libqi-python in Ubuntu 16.04 LTS for proyects in YASYT robotics. 

For more information see: http://github.com/aldebaran/libqi-python

Recipe
-----------

First you should build libqi, preferable according to https://github.com/yumilceh/libqi. Then build libqi-python:

.. code-block:: sh

  git clone https://github.com/yumilceh/libqi-python.git
  cd libqi-python
  mkdir BUILD & cd BUILD
  cmake .. -DQI_WITH_TESTS=OFF -DCMAKE_PREFIX_PATH=~/pepper_ws/libqi/BUILD/output -DCMAKE_CXX_FLAGS:STRING=-std=gnu++0x
  make

The library is in .....<PATH_TO_LIBQI_PYTHON>/BUILD/sdk/lib/python2.7/site-packages/_qi.so

Links
-----

git repository:
http://github.com/aldebaran/libqi
