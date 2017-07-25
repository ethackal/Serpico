FROM alpine:latest

WORKDIR /app

COPY . /app

RUN apk --no-cache add --virtual .build-dependencies build-base ruby-dev sqlite-dev zlib-dev libxml2-dev && \
    apk --no-cache add ruby libstdc++ tzdata bash ca-certificates sqlite-libs && \
    gem install --no-rdoc --no-ri io-console bundler && \
    bundle install && \
    apk del .build-dependencies
