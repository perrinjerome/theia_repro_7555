FROM node:10-alpine


ENV USE_LOCAL_GIT true
RUN apk add --no-cache git openssh bash curl-dev curl openssl-dev zlib-dev make gcc g++

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/
