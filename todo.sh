# General
sudo apt-get update && \
sudo apt-get install -y build-essential cmake wget git unzip yasm pkg-config software-properties-common python3-software-properties

# Get Python 3.6.3
sudo add-apt-repository ppa:jonathonf/python-3.6 && \
sudo apt-get update && \
sudo apt-get install -y python3.6 python3.6-dev python3.6-venv

# For tesseract
sudo add-apt-repository ppa:alex-p/tesseract-ocr && \
sudo apt-get update

# Lib for OpenCV
sudo apt-get update && \
sudo apt-get install -y  libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libdc1394-22-dev \
    libxvidcore-dev libx264-dev libgtk-3-dev libmagic-dev \
    libatlas-base-dev gfortran liblapack-dev \
    libtbb2 libtbb-dev libpq-dev

# pip stuff
wget https://bootstrap.pypa.io/get-pip.py && \
sudo python3.6 get-pip.py && \
sudo python3.6 -m pip install pip --upgrade

sudo rm -f /usr/bin/python && sudo ln -s /usr/bin/python3.6 /usr/bin/python && \
sudo rm -f /usr/bin/python3 && sudo ln -s /usr/bin/python3.6 /usr/bin/python3 && \
sudo rm -f /usr/local/bin/pip && sudo ln -s /usr/local/bin/pip3.6 /usr/local/bin/pip && \
sudo rm -f /usr/local/bin/pip3 && sudo ln -s /usr/local/bin/pip3.6 /usr/local/bin/pip3

# numpy etc
sudo pip install wheel && \
sudo pip install numpy && \
sudo pip install pandas && \
sudo pip install scipy && \
sudo pip install scikit-learn && \
sudo pip install python-magic && \
sudo pip install flask

# lib for tesseract
sudo apt-get update && \
sudo apt-get install -y g++ autoconf automake libtool \
    autoconf-archive zlib1g-dev libicu-dev libpango1.0-dev libcairo2-dev

# tesseract 4
sudo apt-get update && sudo apt-get install -y libleptonica-dev \
    libtesseract4 \
    libtesseract-dev \
    tesseract-ocr

# Get language data.
sudo apt-get install -y \
    tesseract-ocr-spa \
    tesseract-ocr-eng

sudo apt-get -y clean all && \
sudo rm -rf /var/lib/apt/lists/*

wget https://github.com/Itseez/opencv/archive/3.3.1.zip -O opencv.zip \
    && unzip opencv.zip \
    && wget https://github.com/Itseez/opencv_contrib/archive/3.3.1.zip -O opencv_contrib.zip \
    && unzip opencv_contrib \
    && mkdir ~/opencv-3.3.1/build \
    && cd ~/opencv-3.3.1/build \
    && cmake -DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.1/modules \
        -DBUILD_TIFF=ON \
        -DBUILD_opencv_java=OFF \
        -DWITH_CUDA=OFF \
        -DENABLE_AVX=ON \
        -DWITH_OPENGL=ON \
        -DWITH_OPENCL=ON \
        -DWITH_IPP=ON \
        -DWITH_TBB=ON \
        -DWITH_EIGEN=ON \
        -DWITH_V4L=ON \
        -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DCMAKE_CXX_FLAGS=-std=c++11 \
        -DENABLE_PRECOMPILED_HEADERS=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DBUILD_opencv_python3=ON \
        -DCMAKE_INSTALL_PREFIX=$(python3.6 -c "import sys; print(sys.prefix)") \
        -DPYTHON_EXECUTABLE=$(which python3.6) \
        -DPYTHON_INCLUDE_DIR=$(python3.6 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -DPYTHON_PACKAGES_PATH=$(python3.6 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
    && sudo make install \
    && rm get-pip.py \
    && sudo rm -r ~/opencv-3.3.1 \
    && sudo rm -r ~/opencv_contrib-3.3.1 \
    && rm ~/opencv_contrib.zip \
    && rm ~/opencv.zip

mkdir ~/workspace && \
cd ~/workspace

# Python Opencv lib
sudo pip install opencv-python

# Tesseract wrapper
export CXXFLAGS='-std=c++11' &&\
export CFLAGS='-std=c++11' && \
sudo pip install tesserocr
