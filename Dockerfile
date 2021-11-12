FROM node:17-alpine

WORKDIR /usr/src/app

COPY rollup.config.js ./
COPY package*.json ./

COPY ./src ./src
COPY ./public ./public

RUN npm ci && \
    npm run build && \
    npm cache clean --force && \
    npm prune --production && \
    rm -rf ./src && \
    chown -R node:node ./

EXPOSE 5000
ENV HOST=0.0.0.0

USER node

CMD [ "node", "start" ]
