ARG BASE_TAG
FROM rust:${BASE_TAG}

RUN cargo install --locked cargo-outdated

WORKDIR /code

CMD ["cargo", "outdated"]
