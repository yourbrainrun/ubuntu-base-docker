FROM ubuntu:20.04

ENV TZ=Asia/Shanghai

COPY ./sources.list /etc/apt/sources.list

RUN apt update -y \
    && apt install -y curl wget tzdata \
    && rm -rf /etc/localtime \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -rf /var/lib/apt/lists/*

