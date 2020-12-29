FROM ruby:2.7.2-slim

# Remove this ?
ENV RAILS_ENV production

COPY . /code/
WORKDIR /code

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev imagemagick
# Install latest bundler version, let's hope that it won't complain if the version running is newer than the one in the lockfile
RUN gem install bundler
RUN bin/bundle --version
RUN bundle install --deployment --without development test

RUN bin/rails assets:precompile

CMD bin/rails server --binding localhost --port 3080
