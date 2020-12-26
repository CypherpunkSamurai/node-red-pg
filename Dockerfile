ARG ARCH=amd64
ARG NODE_VERSION=12
ARG OS=buster-slim

#### Stage BASE ########################################################################################################
FROM ${ARCH}/node:${NODE_VERSION}-${OS} AS base

# Create source folder
RUN mkdir -p /home/node-red
WORKDIR /home/node-red/

# Copy scripts
COPY . /home/node-red/

# Install tools
RUN set -ex && \
    apt-get update && apt-get install -y \
        bash \
        tzdata \
        curl \
        nano \
       rclone \
        wget \
        git \
        openssl \
        openssh-client \ 
        python3 python3-pip \
        ffmpeg

# Set work directory
WORKDIR /home/node-red/

# Chmod Scripts
RUN chmod 755 *.sh

# Install Extra Node-Red nodes
RUN ./setup.sh

EXPOSE 8080

CMD ["start.sh"]
