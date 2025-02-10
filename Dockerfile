# BUILD
FROM alpine:3.18 AS builder
RUN apk add --no-cache \
    gcc \
    make \
    musl-dev \
    nasm \
    rm -rf /var/cache/apk/*
WORKDIR /app
COPY . /app
RUN make

# RELEASE
FROM alpine:3.18 AS runtime
WORKDIR /app
RUN adduser -D asmbot
USER asmbot
ENV APP_ENV=production
COPY --from=builder /app/main /app/main
HEALTHCHECK --interval=30s --timeout=5s CMD [ "sh", "-c", "pidof main || exit 1" ]
ENTRYPOINT ["/app/main"]
