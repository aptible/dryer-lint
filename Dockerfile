FROM ruby:3.4

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

RUN bundle install

COPY test.rb /app

CMD ["bundle", "exec", "rubocop"]
