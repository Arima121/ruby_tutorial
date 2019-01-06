FROM ruby:latest

WORKDIR /home/ruby/app

COPY . .
RUN bundle install --deployment

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-E", "production"]
