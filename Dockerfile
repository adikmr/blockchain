FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y wget tar \
    && wget https://bitcoincore.org/bin/bitcoin-core-26.0/bitcoin-26.0-aarch64-linux-gnu.tar.gz \
    && tar -xzf bitcoin-26.0-aarch64-linux-gnu.tar.gz --strip-components=1 -C /usr/local \
    && rm bitcoin-26.0-aarch64-linux-gnu.tar.gz
CMD ["bitcoind", "-regtest", "-printtoconsole"]