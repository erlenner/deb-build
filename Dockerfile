FROM ubuntu:focal
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install build tools
RUN sed -i 's/# deb-src/deb-src/g' /etc/apt/sources.list \
  && apt-get update && apt-get install --no-install-recommends -y \
  dpkg-dev \
  vim \
  quilt \
  devscripts \
  dput \
  build-essential \
  debhelper-compat \
  catkin libboost-system-dev libboost-thread-dev libconsole-bridge-dev libboost-date-time-dev libgtest-dev \
  python3-genmsg python3-all dh-python \
  && rm -rf /var/lib/apt/lists/

WORKDIR /root
