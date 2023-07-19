# hash:sha256:005d5859f78c74408c12bc1cdc5961a1c529a0a33c97c2d271dacee9d0c7716e
FROM registry.acmecorp-cfn-demo.codeocean.com/codeocean/jupyterlab:3.0.9-miniconda4.9.2-python3.8-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        jq=1.6-1ubuntu0.20.04.1 \
    && rm -rf /var/lib/apt/lists/*
