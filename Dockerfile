FROM node:16-alpine3.16 AS Build

WORKDIR /lib

COPY package.json package.json

RUN yarn install

FROM node:16-alpine3.16 AS RUN 

WORKDIR /mailer

COPY . . 

COPY --from=Build /lib/node_modules /mailer/node_modules

ENV PORT=1337

EXPOSE ${PORT}

CMD [ "yarn", "start" ]