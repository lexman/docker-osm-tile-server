# Dockerfile for 
FROM debian:wheezy

MAINTAINER Alexandre Bonnasseau

RUN apt-get update 
RUN apt-get install -y \
    locales \

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get install python-software-properties
RUN add-apt-repository ppa:mapnik/boost
RUN apt-get update
RUN apt-get install \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-python-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-thread-dev

RUN apt-get install -y \
git-core \
tar \
unzip \
bzip2 \
build-essential \
autoconf \
libtool \
libxml2-dev \
libgeos-dev \
libpq-dev \
libbz2-dev proj \
munin-node munin \
libprotobuf-c0-dev \
protobuf-c-compiler \
libfreetype6-dev \
libpng12-dev \
libtiff4-dev \
libicu-dev \
libgdal-dev \
libcairo-dev \
libcairomm-1.0-dev \
apache2 \
apache2-dev \
libagg-dev \
liblua5.2-dev \
ttf-unifont

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main"> /etc/apt/sources.list.d/postgis.list

RUN wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

RUN apt-get update

RUN apt-get install postgresql-9.3-postgis-2.1 postgresql-contrib


RUN apt-get install -y \
postgresql-9.1-postgis postgresql-contrib postgresql-server-dev-9.1
