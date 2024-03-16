FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/route53 \
    --with github.com/caddy-dns/duckdns
    #--with github.com/HeavenVolkoff/caddy-authelia/plugin \
    #fix-empty-copy-headers \
FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy