FROM node:lts-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g pm2
RUN npm ci --only=production

COPY . .

CMD ["pm2-runtime", "start", "index.js", "--name", "application", "--no-daemon", "--no-auto-exit", "--instances", "max", "--log", "/dev/null"]
