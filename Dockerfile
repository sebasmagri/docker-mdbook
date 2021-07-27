FROM alpine:3.14 as builder

RUN apk add --update cargo && \
    cargo install mdbook --no-default-features --features search --vers "^0.4.0"

FROM alpine:3.14

COPY --from=builder /root/.cargo/bin/mdbook /usr/bin/mdbook

RUN apk add --update --no-cache llvm11-libs