FROM ruby:2.3

MAINTAINER Andrew Porter <partydrone@me.com>

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
--no-install-recommends \
&& rm -rf /var/lib/apt/lists/*

ENV APP_HOME /var/app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* ${APP_HOME}/

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . $APP_HOME
