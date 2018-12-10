FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN apt-get install -y tree vim mongodb-clients

RUN echo "alias ll=\"ls -lah \"" >> ~/.bashrc
RUN echo "alias be=\"bundle exec \"" >> ~/.bashrc
RUN gem install bundler

COPY Gemfile /tmp/ # cannot copy Gemfile.lock, references non-existing ish_manager
WORKDIR /tmp
RUN bundle install

ENV ROOT /microsites3
RUN mkdir -p $ROOT
WORKDIR $ROOT
ADD . $ROOT

EXPOSE 80
EXPOSE 3000
EXPOSE 3001
EXPOSE 3002

# CMD rails s --port 3000 -b 0.0.0.0
