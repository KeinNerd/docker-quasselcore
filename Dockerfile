FROM ubuntu:18.04

MAINTAINER KeinNerd <github@keinnerd.net>

# install required packages for the build process
RUN \
 apt-get update && apt-get install -y \
  cmake \
  make \
  build-essential \
  libboost-all-dev \
  git-core \
  icu-devtools \
  libicu60 \
  libssl-dev \
  qtbase5-dev \
  qttools5-dev \
  libqt5dbus5 \
  qtbase5-dev-tools \
  qtscript5-dev \
  libqt5sql5-psql \
  libqt5sql5-sqlite \
  libldap2-dev \
  libqca-qt5-2-dev

# clone quassel-core source
RUN mkdir -p /tmp/quassel-src
RUN git clone https://github.com/quassel/quassel.git /tmp/quassel-src
RUN mkdir -p /tmp/quassel-src/build

# build the quassel-core
WORKDIR /tmp/quassel-src
RUN cmake \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX=/usr/local/ \
        -DUSE_QT5=ON \
        -DWANT_CORE=ON \
        -DWANT_MONO=OFF \
        -DWANT_QTCLIENT=OFF \
        -DWITH_KDE=OFF \
        -DWITH_CRYPT=ON . \
        /tmp/quassel-src && \
make && \
make install

# Volumes
VOLUME /config

# set environment variables
ENV HOME /config

# copy startfile
COPY start.sh /start.sh

# ports
EXPOSE 4242 4242

# start quassel-core
ENTRYPOINT ["/start.sh"]
