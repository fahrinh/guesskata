FROM ruby:2.6.3-alpine3.9

RUN gem install bundler

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install --deployment --without development test

ADD . $APP_HOME

#ENTRYPOINT $APP_HOME/bin/guesskata.sh
#ENTRYPOINT /bin/bash

ENTRYPOINT bundle exec $APP_HOME/bin/guesskata.sh