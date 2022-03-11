ARG BASE_TAG
FROM rust:${BASE_TAG} AS debian

RUN rustup component add clippy

WORKDIR /code

CMD ["cargo", "clippy", "--", "-D", "warnings"]

ARG BASE_TAG
FROM rust:${BASE_TAG} AS alpine

RUN apk add --no-cache musl-dev

RUN rustup component add clippy

WORKDIR /code

CMD ["cargo", "clippy", "--", "-D", "warnings"]
