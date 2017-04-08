FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /the_voting
WORKDIR /the_voting
ADD Gemfile /the_voting/Gemfile
ADD Gemfile.lock /the_voting/Gemfile.lock
RUN bundle install
ADD . /the_voting
ADD config/application.yml /the_voting/config/application.yml

