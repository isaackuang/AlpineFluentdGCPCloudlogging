FROM isaackuang/alpine-base:3.8.1

RUN apk add --no-cache \
        ca-certificates \
        ruby ruby-irb ruby-etc ruby-webrick && \
    apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev gnupg && \
    echo 'gem: --no-document' >> /etc/gemrc && \
    gem install oj && \
    gem install json && \
    gem install fluentd && \
    gem install bigdecimal && \
    gem install fluent-plugin-google-cloud && \
    apk del .build-deps && \
    rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY config /
