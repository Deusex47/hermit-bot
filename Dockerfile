FROM quay.io/hermit/hermit-ser:latest

RUN git clone https://github.com/A-d-i-t-h-y-a-n/hermit-bot /root/hermit-md
WORKDIR /root/hermit-md/
RUN yarn install --production --ignore-engines
CMD ["node", "index.js"]
