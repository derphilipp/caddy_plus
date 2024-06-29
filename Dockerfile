FROM caddy:2.7-builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/route53 \
  --with github.com/caddy-dns/duckdns
# --with github.com/lucaslorentz/caddy-docker-proxy/v2@v2.9.1 \
# --with github.com/lucaslorentz/caddy-docker-proxy@v2.9.1 \

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
