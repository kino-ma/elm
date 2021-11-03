FROM --platform=linux/amd64 node:17-buster

WORKDIR /app

COPY ./package*.json /app/

RUN yarn install 

CMD yarn run build
