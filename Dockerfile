FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | /bin/bash

RUN apt-get install -y nodejs \
        postgresql-9.5 \
        postgresql-contrib-9.5 \
        postgresql-server-dev-9.5 \
        git-core \
        redis-server \
        build-essential \
        libdb-dev \
        libexpat1-dev \
        libicu-dev \
        liblocal-lib-perl \
        libpq-dev \
        libxml2-dev \
        wget \
        cpanminus

RUN echo 'eval $( perl -Mlocal::lib )' >> ~/.bashrc && /bin/bash -c "source ~/.bashrc"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install yarn

RUN wget ftp://ftp.musicbrainz.org/pub/musicbrainz/data/sample/20190501-000001/*

