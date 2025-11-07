ARG RUBY_VERSION=3.4

FROM ruby:${RUBY_VERSION}

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

RUN bundle install

COPY test.rb /app

CMD ["bundle", "exec", "rubocop"]
