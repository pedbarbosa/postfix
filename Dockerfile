FROM alpine:latest

RUN apk --update upgrade && \
    apk add curl cyrus-sasl cyrus-sasl-plain postfix rsyslog supervisor && \
    rm -rf /var/cache/apk/*

COPY etc/ /etc/
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 25
CMD ["/run.sh"]
