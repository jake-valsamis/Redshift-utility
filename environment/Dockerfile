# hash:sha256:4d1009a7c63db1e5a18be080e93d060292addb9c24963c1260dc6f9579a8a6b7
FROM registry.acmecorp-cfn-demo.codeocean.com/codeocean/jupyterlab:3.0.9-miniconda4.9.2-python3.8-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        jq=1.6-1ubuntu0.20.04.1 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U --no-cache-dir \
    numpy==1.24.4 \
    pandas==2.0.2 \
    redshift-connector==2.0.911

RUN pip3 install -U --no-cache-dir \
    python-dotenv==1.0.0

COPY postInstall /
RUN /postInstall
