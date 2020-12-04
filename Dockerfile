FROM ghcr.io/alphagov/verify/ruby:2.6.6

RUN apt-get update && apt-get install -y firefox-esr nodejs git

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN gem install --update bundler
RUN bundle install

CMD [ "irb" ]
