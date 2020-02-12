FROM alpine

RUN apk --no-cache add iproute2 iptables socat bash

WORKDIR /app

COPY src/start.sh .

CMD ["/bin/bash", "/app/start.sh"]