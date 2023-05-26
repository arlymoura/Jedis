FROM ruby:2.7.2
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES 1

RUN apk update \
    && apk add tzdata \
    && apk add postgresql-client \
    && apk add postgresql-dev \
    && apk add make \
    && apk add libxml2-dev libxslt-dev \
    && apk add libc-dev gcc \
    && apk add --no-cache imagemagick \
    && apk add git \
    && apk add less

RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN echo "America/Sao_Paulo" > /etc/timezone

COPY . /usr/src/app/

EXPOSE 3000

RUN bundle install
