FROM alpine:latest

# ARG CI_PIPELINE=false
# RUN BASE_PATH="."
ARG BASE_PATH="."
# RUN if [ "$CI_PIPELINE" = true ]; then BASE_PATH="images/alpine"; fi

# bash
RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache bind-tools
RUN apk add --no-cache jq
RUN apk add --no-cache vim
RUN apk add --no-cache github-cli

RUN mkdir /opt/wm
RUN mkdir /opt/wm/scripts


COPY ${BASE_PATH}/scripts/* /opt/wm/scripts
COPY ${BASE_PATH}/resources/.bashrc /root/.bashrc

# Set Bash as the default command for interactive use
CMD ["/bin/bash"]