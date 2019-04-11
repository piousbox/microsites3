FROM ubuntu:18.04

RUN apt-get update -y && apt-get install -y build-essential tree vim ruby2.5 ruby2.5-dev \
  git libxml2 libxml2-dev curl wget mongodb-clients strace

ENV APP_ROOT /opt/microsites3
RUN mkdir -p $APP_ROOT

COPY Gemfile Gemfile.lock $APP_ROOT/
WORKDIR $APP_ROOT
RUN gem install bundler
RUN bundle

COPY . $APP_ROOT/
RUN . $APP_ROOT/_bashrc
