FROM ruby:3.3.4-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 \
    nodejs \
    npm \
    zlib1g-dev \
    liblzma-dev \
    patch \
    pkg-config \
    libxml2-dev \
    libxslt-dev \
    imagemagick \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install bundler

WORKDIR /usr/src/app

COPY Gemfile* .

RUN bundle install

COPY . .

RUN bundle exec rails dartsass:build

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
