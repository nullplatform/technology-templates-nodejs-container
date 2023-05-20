FROM node:lts-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g pm2
RUN npm ci --only=production

COPY . .

CMD ["pm2-runtime", "start", "index.js", "--name", "application", "--no-auto-exit", "--instances", "max", "--output", "/dev/null", "--error", "/dev/null"]
