FROM ruby:3.1.1-alpine3.14

WORKDIR /app/f1x
COPY . .

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1 && \
    apk --update add \
      autoconf build-base bzip2 ca-certificates curl-dev dialog libc-dev \
      libffi-dev libssh2-dev libxml2-dev libxslt-dev linux-headers procps readline-dev \
      ruby-dev shared-mime-info tzdata yaml-dev zlib-dev && \
    bundle install


CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
