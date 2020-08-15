FROM alpine:3.12

COPY --from=bianzhifu/tdlib:1.6.0_alpine_3.12 /usr/local/include/td /usr/local/include/td
COPY --from=bianzhifu/tdlib:1.6.0-alpine-3.12 /usr/local/lib/libtd* /usr/local/lib/

RUN apk update && apk add --no-cache git gcc libc-dev g++ make openssl-dev zlib-dev && rm -rf /var/cache/apk/*
