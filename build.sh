#!/bin/bash
set -eo pipefail

docker build -t bschuedzig/slowdown .

set +e
docker rm slowdown
set -e

docker run \
    --cap-add NET_ADMIN \
    --link nginx \
    -p 9999:9999 \
    -e LISTEN=9999 \
    -e HOST=nginx \
    -e PORT=80 \
    -e DELAY=100ms \
    bschuedzig/slowdown
