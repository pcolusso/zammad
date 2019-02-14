FROM ruby:2.6.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates nodejs vim optipng jpegoptim libxml2-dev libcurl4-openssl-dev cron \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Australia/Sydney" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /opt/zammad
WORKDIR /opt/zammad

COPY Gemfile .

ENV RAILS_ENV production

RUN bundle install 

COPY . .

#RUN bundle exec rails assets:precompile

CMD ['foreman', 'start']
