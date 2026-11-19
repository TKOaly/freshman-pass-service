FROM debian:12-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    autoconf \
    bash \
    bison \
    build-essential \
    ca-certificates \
    curl \
    gnupg2 \
    less \
    git \
    libdb-dev \
    libffi-dev \
    libgdbm-dev \
    libgmp-dev \
    libncurses5-dev \
    libpq-dev \
    postgresql-client \
    libreadline-dev \
    libssl-dev \
    nodejs \
    libvips42 \
    sqlite3 \
    libsqlite3-dev \
    libyaml-dev \
    uuid-dev \
    zlib1g-dev \
    liblzma-dev \
    patch \
    pkg-config \
    libxml2-dev \
    libxslt-dev \
    imagemagick \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV RBENV_ROOT=/usr/local/rbenv \
  RUBY_VERSION=2.6.10

ENV PATH=$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH

# Ruby 2.6 is EOL, so the GHSA-34m4-m9fh-gqp5 fix (ruby/ruby@d582f8f) is applied here until the Ruby upgrade.
COPY patches/ruby-sharp-s-case-map-overflow.patch /tmp/ruby.patch

RUN git clone --depth 1 https://github.com/rbenv/rbenv.git "$RBENV_ROOT" \
  && git clone --depth 1 https://github.com/rbenv/ruby-build.git "$RBENV_ROOT/plugins/ruby-build" \
  && rbenv install --patch "$RUBY_VERSION" < /tmp/ruby.patch \
  && rm /tmp/ruby.patch \
  && rbenv global "$RUBY_VERSION" \
  && ruby --version \
  && gem --version

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system 3.4.22 && gem install bundler

WORKDIR /usr/src/app

COPY Gemfile* .

RUN bundle install

COPY . .

# Precompile so public/assets is always in sync with the current source (not committed to git).
RUN SECRET_KEY_BASE=dummy-build-secret RAILS_ENV=production bundle exec rails assets:precompile

# ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
