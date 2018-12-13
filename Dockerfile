From ruby:2.3.1

ENV RAILS_ENV docker
ENV ROOT /home/ubuntu/projects/microsites3
ENV PORT 3000

RUN apt-get update && \
  apt-get install -y build-essential && \
  echo ok

RUN mkdir -p $ROOT
WORKDIR $ROOT

# ADD . $ROOT
COPY . .
RUN bundle install

CMD RAILS_ENV=docker bundle exec rails s -p ${PORT} -b '0.0.0.0'

