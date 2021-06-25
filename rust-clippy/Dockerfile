FROM rust:latest

RUN rustup component add clippy

WORKDIR /code

CMD ["cargo", "clippy", "--", "-D", "warnings"]
