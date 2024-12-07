FROM ubuntu:25.04

# Development environment installation
## Set environment variables

## Install dependencies
### Install apt-get packages
RUN apt-get update && \
    apt-get install -y build-essential cmake curl git make python3 unzip

### Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

### Install Lune
RUN /bin/bash -c "source $HOME/.cargo/env && cargo install lune --version 0.8.8 --locked"
