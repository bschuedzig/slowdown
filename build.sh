#!/bin/bash
set -eo pipefail

docker build -t bschuedzig/slowdown .

# docker run --link nginx -p 9999:9999 -e LISTEN=9999 -e HOST=nginx -e PORT=80 bschuedzig/slowdown
