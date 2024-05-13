FROM caddy:2.8-builder AS builder

RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,direct

RUN caddy-builder github.com/caddy-dns/alidns

FROM caddy:2.8


COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile