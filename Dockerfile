FROM docker.io/library/ruby:3.1.2

RUN apt-get update \
 && apt-get install -y build-essential libpq-dev imagemagick

# Remove this ?
ENV RAILS_ENV production

COPY . /code/
WORKDIR /code

# We currently hardcode the bundler version here too
# Not very elegant, but well...
RUN gem install bundler --version 2.5.3

RUN bin/bundle config set --local deployment 'true' \
 && bin/bundle config set --local without 'development test' \
 && bin/bundle install

RUN bin/rails assets:precompile

CMD bin/rails server --binding localhost --port 3080
