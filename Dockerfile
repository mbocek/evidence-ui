FROM node:17-alpine

WORKDIR /usr/src/app

COPY rollup.config.js ./
COPY package*.json ./

COPY ./src ./src
COPY ./public ./public

RUN npm install && \
    npm run build && \
    npm prune --production && \
    rm -rf ./src

EXPOSE 5000
ENV HOST=0.0.0.0

CMD [ "npm", "start" ]
