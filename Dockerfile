FROM node:latest

WORKDIR /app

COPY ./package*.json /app/

RUN yarn install 

CMD npm run build