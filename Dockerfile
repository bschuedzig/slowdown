FROM alpine

RUN apk --no-cache add iproute2 iptables socat bash

# FROM ubuntu:18.04

# RUN apt update \
#     && apt install -y iproute2 socat net-tools iptables \
#     && apt autoremove \
#     && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/start.sh .

CMD ["/bin/bash", "/app/start.sh"]