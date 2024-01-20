FROM alpine:latest

# bash
RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache bind-tools
RUN apk add --no-cache jq
RUN apk add --no-cache vim

RUN mkdir /opt/wm

COPY ./scripts/* /opt/wm/scripts

# Set Bash as the default command for interactive use
CMD ["/bin/bash"]