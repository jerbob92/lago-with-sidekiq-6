FROM getlago/api:v0.37.0-beta

RUN apk add --no-cache \
  git

RUN bundle remove sidekiq && bundle add sidekiq --version "~> 6"
RUN sed -i "s/pool_timeout: 5,//g" config/initializers/sidekiq.rb
