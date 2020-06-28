FROM python:3.8.3-slim-buster

ENV PIP_NO_CACHE_DIR 1

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    wget curl \
    aria2 ffmpeg rclone \
    coreutils bash procps \
    linux-headers-amd64 pv jq \
    && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app
WORKDIR /usr/src/app/

RUN python3 -m pip install --no-cache-dir --upgrade -r requirements.txt

CMD ["python3", "-m", "tobrot"]
