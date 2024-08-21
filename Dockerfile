FROM ruby:3.3.4-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system 3.4.22 && gem install bundler

WORKDIR /usr/src/app

COPY Gemfile* .

RUN bundle install

COPY . .

RUN rails assets:precompile
EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
