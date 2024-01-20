FROM alpine:latest

# bash
RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache bind-tools
RUN apk add --no-cache jq

# Set Bash as the default command for interactive use
CMD ["/bin/bash"]