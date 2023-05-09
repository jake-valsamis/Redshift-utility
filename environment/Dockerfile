# hash:sha256:e4e868db07ed20df1e1113812e6e3c210811d3ee8b66ce6af3233f32be012a6c
FROM registry.acmecorp-cfn-demo.codeocean.com/codeocean/jupyterlab:3.0.9-miniconda4.9.2-python3.8-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        jq \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U --no-cache-dir \
    numpy \
    pandas \
    redshift-connector

RUN pip3 install -U --no-cache-dir \
    python-dotenv

COPY postInstall /
RUN /postInstall
