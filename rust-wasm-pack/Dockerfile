FROM node:current-buster

# install tooling
RUN apt-get update \
    && apt-get install -y curl make \
    && rm -rf /var/lib/apt/lists/*

# install rust
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates gcc libc6-dev \
    && curl -L --output rustup-init "https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init" \
    && chmod +x rustup-init \
    && ./rustup-init -y --no-modify-path --default-toolchain nightly \
    && rm rustup-init \
    && chmod -R a+w $RUSTUP_HOME $CARGO_HOME \
    && rustup --version \
    && cargo --version \
    && rustc --version \
    && rm -rf /var/lib/apt/lists/*

# install wasm-pack
RUN curl -L --output wasm-pack-init https://rustwasm.github.io/wasm-pack/installer/init.sh \
    && chmod +x wasm-pack-init \
    && ./wasm-pack-init \
    && rm wasm-pack-init
