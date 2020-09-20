FROM ruby:2.7.1-alpine

RUN apk add --no-cache \
  build-base

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY app ./app
COPY config ./config
COPY config.ru site_counter.rb ./

EXPOSE $PORT
CMD bundle exec puma -p $PORT
