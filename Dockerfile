FROM isaackuang/fluentd

RUN fluent-gem install fluent-plugin-google-cloud

COPY config /
