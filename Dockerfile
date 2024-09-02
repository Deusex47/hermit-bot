RUN apt-get update && \
    apt-get -y install ffmpeg git imagemagick graphicsmagick ca-certificates curl gnupg && \
    apt-get purge -y nodejs && \
    rm -fr /etc/apt/sources.list.d/nodesource.list && \
    rm -fr /etc/apt/trusted.gpg.d/nodesource.gpg && \
    mkdir -p /etc/apt/trusted.gpg.d && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/trusted.gpg.d/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs npm && \
    npm install --global yarn && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    yarn global add pm2
RUN git clone https://github.com/A-d-i-t-h-y-a-n/hermit-bot /root/hermit-md
WORKDIR /root/hermit-md/
RUN yarn install --network-concurrency 1
CMD ["node", "index.js"]
