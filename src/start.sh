#!/bin/bash

if [[ -z "$LISTEN" ]]; then
    echo "Error: please provide a listen port (LISTEN)"
    exit 1
fi

if [[ -z "$HOST" ]]; then
    echo "Error: please provide a target host (HOST)"
    exit 2
fi

if [[ -z "$PORT" ]]; then
    echo "Error: please provide a target port (PORT)"
    exit 3
fi

if [[ -z "$DELAY" ]]; then
    echo "DELAY: no delay specified"

else
    echo "DELAY: Applying $DELAY"
    tc qdisc add dev eth0 root netem delay $DELAY
fi

CMD="socat TCP-LISTEN:$LISTEN,fork,reuseaddr TCP:$HOST:$PORT"

echo "Executing: $CMD"

exec $CMD
