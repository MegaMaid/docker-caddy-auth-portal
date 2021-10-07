FROM caddy:2.4.5-builder-alpine AS builder

RUN xcaddy build \
	--with github.com/greenpau/caddy-auth-portal@v1.4.24 \
	--with github.com/greenpau/caddy-auth-jwt@v1.3.16 \
	--with github.com/caddy-dns/cloudflare

FROM caddy:2.2.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY /root/ /