FROM node:10-buster


# Install tools
RUN set -ex && \
    apt-get update && apt-get install -yq \
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

# Create work dir
RUN mkdir -p /home/node/app/node_modules && \
chown -R node:node /home/node/app

# Change to work dir
WORKDIR /home/node/app

# Cache Npm into Docker Cache
COPY package*.json ./

# Change user
USER node

# Run Npm
RUN npm install

# Copy Source
COPY --chown=node:node . .

# Chmod Scripts
RUN chmod 755 *.sh

# Install Extra Node-Red nodes
RUN ./setup.sh

# Set PATH
RUN export PATH=$(npm bin):$PATH

# Port Expose 5000
EXPOSE 5000


CMD ["npm","start"]
