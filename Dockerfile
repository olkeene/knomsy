FROM ruby:2.3.1-slim

RUN apt-get update -qq && \
    apt-get install -y \
      build-essential git \
      postgresql-client libpq-dev --no-install-recommends && \
    apt-get clean

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP /app
ENV BUNDLE_PATH /bundle
VOLUME $BUNDLE_PATH

# Gems
RUN gem install bundler --no-rdoc --no-ri

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --jobs 4 --retry 5

# App
RUN mkdir $APP
WORKDIR $APP
ADD . $APP

EXPOSE 3000

ENTRYPOINT bin/docker-entrypoint.sh $0 $@
