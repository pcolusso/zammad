FROM ruby:2.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs vim optipng jpegoptim libxml2-dev libcurl4-openssl-dev cron \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Australia/Sydney" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /opt/zammad
WORKDIR /opt/zammad

COPY Gemfile* .

RUN bundle install --without test development postgres

RUN RAILS_ENV=production bundle exec rails assets:precompile

CMD ['foreman', 'start']