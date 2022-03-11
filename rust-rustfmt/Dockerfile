ARG BASE_TAG
FROM rust:${BASE_TAG} AS debian

RUN rustup component add clippy

WORKDIR /code

CMD ["rustfmt"]

ARG BASE_TAG
FROM rust:${BASE_TAG} AS alpine

RUN rustup component add clippy

WORKDIR /code

CMD ["rustfmt"]
