FROM ruby:2.5.1-slim

# Remove this ?
ENV RAILS_ENV production

COPY . /code/
WORKDIR /code

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev imagemagick
RUN bin/bundle --version
RUN bundle install --deployment --without development test

RUN bin/rails assets:precompile

CMD bin/rails server --binding localhost --port 3080
