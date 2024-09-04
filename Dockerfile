FROM quay.io/hermit/hermit-ser:latest
RUN git clone https://github.com/A-d-i-t-h-y-a-n/hermit-bot /root/hermit-md
WORKDIR /root/hermit-md/
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["pm2-runtime", "index.js"]
