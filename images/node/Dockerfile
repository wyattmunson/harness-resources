FROM wyattmunson/cicd-base:0.2.0

# ARG CI_PIPELINE=false
# RUN BASE_PATH="."
ARG BASE_PATH="."
# RUN if [ "$CI_PIPELINE" = true ]; then BASE_PATH="images/alpine"; fi

# bash
RUN apk add --no-cache nodejs npm

# RUN mkdir /opt/wm
# RUN mkdir /opt/wm/scripts


COPY ${BASE_PATH}/scripts/* /opt/wm/scripts
# COPY ${BASE_PATH}/resources/.bashrc /root/.bashrc
RUN chmod +x /opt/wm/scripts/*

# Set Bash as the default command for interactive use
CMD ["/bin/bash"]