FROM ruby:2.6.10-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 \
    nodejs \
    sqlite3 \
    libsqlite3-dev \
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

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 5001

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]