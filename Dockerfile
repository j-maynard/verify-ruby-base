# This should be kept in sync with the Dockerfiles at:
# https://github.com/alphagov/verify-infrastructure-config/blob/339dab2/pipelines/deployer/deploy-verify-hub.yml#L1002
# https://github.com/alphagov/verify-infrastructure-config/blob/339dab2/pipelines/deployer/deploy-verify-hub.yml#L1107
# TODO this should be enforced via technical measures (i.e. factoring out common code).
FROM ghcr.io/alphagov/verify/ruby:2.6.6

RUN apt-get update && apt-get install -y firefox-esr nodejs git

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN gem install --update bundler
RUN bundle install

CMD [ "irb" ]
