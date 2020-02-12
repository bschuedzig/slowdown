FROM ubuntu:18.04

RUN apt update \
    && apt upgrade -y \
    && apt install -y iproute2 socat net-tools \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/start.sh .

CMD ["/bin/bash", "/app/start.sh"]