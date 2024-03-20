FROM alpine:3.19

LABEL org.opencontainers.image.source https://github.com/fopina/docker-keepalived

RUN apk add --no-cache keepalived

COPY --from=fopina/confgen:0.1.10 /confgen /usr/local/bin/confgen

RUN mkdir /etc/keepalived
COPY keepalived.conf.tmpl /etc/keepalived/keepalived.conf.tmpl

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# default configuration
ENV KEEPALIVED_VRRP=VI_1
ENV KEEPALIVED_STATE=MASTER
ENV KEEPALIVED_ETH=eth0
ENV KEEPALIVED_ROUTER=51
ENV KEEPALIVED_PRIORITY=255
ENV KEEPALIVED_ADVERT=1
ENV KEEPALIVED_AUTH=""
ENV KEEPALIVED_VIP="10.0.99.99/16"

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
