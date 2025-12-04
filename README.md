# docker-keepalived

**A docker image to run [keepalived](http://keepalived.org/)** 

> No longer maintained, I've moved from docker swarm to k3s (and metallb replaces my use for this)

## Quick start

This image require the kernel module ip_vs loaded on the host (`modprobe ip_vs`) and needs some extra capabilities:

```
docker run --cap-add=NET_ADMIN \
           --cap-add=NET_BROADCAST \
           --cap-add=NET_RAW \
           --net=host \
           ghcr.io/fopina/keepalived
```

## Usage

Image entrypoint is `keepalived` itself with flags `-n -l`: run in foreground (as it is a container) and log to console

Listing all keepalived options:

```
docker run --rm ghcr.io/fopina/keepalived -h
Usage: keepalived [OPTION...]
  -f, --use-file=FILE          Use the specified configuration file
...
  -D, --log-detail             Detailed log messages
...
```

To enable detailed logging:

```
docker run --rm ghcr.io/fopina/keepalived --log-detail
```

Check [Dockerfile](Dockerfile) or [configuration template](keepalived.conf.tmpl) for an accurate list of environment configuration and their defaults:

```
# default configuration
ENV KEEPALIVED_VRRP=VI_1
ENV KEEPALIVED_STATE=MASTER
ENV KEEPALIVED_ETH=eth0
ENV KEEPALIVED_ROUTER=51
ENV KEEPALIVED_PRIORITY=255
ENV KEEPALIVED_ADVERT=1
ENV KEEPALIVED_AUTH=""
ENV KEEPALIVED_VIP="10.0.99.99/16"
```

