FROM ubuntu:20.04

WORKDIR /work
COPY cpp /root/.config/atcoder-cli-nodejs/cpp
COPY ssh /root/.ssh
COPY ac-library /ac-library
COPY src /work
RUN apt update && apt upgrade -y && apt install -y tzdata && \
    apt install -y \
    git \
    gcc \
    g++ \
    python3 \
    pip \
    nodejs \
    npm \
    && npm update -g npm && npm install -g atcoder-cli \
    && pip3 install online-judge-tools \
    && acc config oj-path /usr/local/bin/oj \
    && acc config default-test-dirname-format test \
    && acc config default-template cpp \
    && acc config default-task-choice inquire \
    && chmod 600 /root/.ssh/* \
    && echo 'alias acclogin="acc login"' >> ~/.bashrc \
    && echo 'alias ojlogin="oj login https://beta.atcoder.jp/"' >> ~/.bashrc \
    && echo 'alias test="g++ main.cpp -std=c++14 -I /ac-library && oj t"' >> ~/.bashrc
