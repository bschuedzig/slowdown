TCP proxy that allows to slow down connections.

# Usage

```bash
# Start example nginx container
docker run -d --name nginx nginx

# Start TCP proxy
docker run \
    --cap-add NET_ADMIN \
    --link nginx \
    -p 9999:9999 \
    -e LISTEN=9999 \
    -e HOST=nginx \
    -e PORT=80 \
    -e DELAY=100ms \
    bschuedzig/slowdown
```
