ARG BASE_TAG
FROM rust:${BASE_TAG}

RUN apk add --no-cache musl-dev pkgconfig openssl-dev

RUN cargo install --locked cargo-outdated

WORKDIR /code

CMD ["cargo", "outdated"]
