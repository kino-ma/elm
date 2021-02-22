FROM node:latest

WORKDIR /app

RUN apk add make

COPY ./package*.json /app/

RUN yarn install 

COPY ./ /app

CMD make build