FROM ruby:2.7.2

WORKDIR /usr/src/app

COPY . .

EXPOSE 3000

RUN bundle install

CMD [ "bash -c", "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"]

