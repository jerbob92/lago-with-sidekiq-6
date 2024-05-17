FROM getlago/api:v1.3.0 as build

RUN bundle remove sidekiq && bundle add sidekiq --version "~> 6"

FROM getlago/api:v1.3.0

COPY --from=build /usr/local/bundle/ /usr/local/bundle
COPY --from=build /app/Gemfile /app
COPY --from=build /app/Gemfile.lock /app
RUN sed -i "s/pool_timeout: 5,//g" config/initializers/sidekiq.rb
