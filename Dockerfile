FROM ruby:3.0.2-alpine3.14

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1 && \
    apk --update add \
    autoconf build-base bzip2 ca-certificates curl-dev dialog libc-dev \
    libffi-dev libssh2-dev libxml2-dev libxslt-dev linux-headers procps readline-dev \
    ruby-dev shared-mime-info tzdata yaml-dev zlib-dev

WORKDIR /usr/src/f1x

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
