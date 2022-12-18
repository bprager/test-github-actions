FROM node:18

WORKDIR /usr/src/app

COPY package*.json yarn.lock ./

RUN [ "/bin/bash", "-c", "yarn install --pure-lockfile 2> >(grep -v warning 1>&2) && mv node_modules ../"]

ENV PATH /usr/node_modules/.bin:$PATH

COPY . .

EXPOSE 3000

LABEL maintainer="Bernd Prager <bprager@github>"