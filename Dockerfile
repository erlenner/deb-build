FROM ubuntu:focal
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install build tools
RUN sed -i 's/# deb-src/deb-src/g' /etc/apt/sources.list \
  && apt-get update && apt-get install --no-install-recommends -y \
  dpkg \
  dpkg-dev \
  vim \
  curl \
  lsb-release \
  quilt \
  devscripts \
  dput \
  build-essential \
  debhelper-compat
  #python3-genmsg python3-all dh-python
  #catkin libboost-system-dev libboost-thread-dev libconsole-bridge-dev libboost-date-time-dev libgtest-dev


RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
  printf "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main\ndeb-src http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
  apt-get update && \
  apt-get install -y ros-noetic-ros-base

RUN apt-get update && apt-get install -y g++-10 software-properties-common

WORKDIR /root
