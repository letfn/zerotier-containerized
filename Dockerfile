FROM debian:buster-slim as builder
LABEL version="1.6.3"
LABEL description="Containerized ZeroTier One for use on CoreOS or other Docker-only Linux hosts."

RUN apt-get update && apt-get install -y curl gnupg
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 0x1657198823e52a61  && \
    echo "deb http://download.zerotier.com/debian/buster buster main" > /etc/apt/sources.list.d/zerotier.list
RUN apt-get update && apt-get install -y zerotier-one=1.6.3

EXPOSE 9993/udp

RUN mkdir -p /var/lib/zerotier-one

COPY main.sh /main.sh
RUN chmod 0755 /main.sh
ENTRYPOINT ["/main.sh"]

CMD ["zerotier-one"]
