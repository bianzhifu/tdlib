FROM golang:alpine

COPY --from=bianzhifu/tdlib:latest /usr/local/include/td /usr/local/include/td
COPY --from=bianzhifu/tdlib:latest /usr/local/lib/libtd* /usr/local/lib/

RUN apk update && apk add --no-cache git gcc libc-dev g++ make openssl-dev zlib-dev && rm -rf /var/cache/apk/*
