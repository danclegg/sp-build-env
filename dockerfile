FROM byuoitav/build-env:master
MAINTAINER danclegg <dgclegg@byu.edu>

RUN apk update
RUN apk upgrade

RUN apk add nodejs nodejs-npm

RUN npm install -g -U npm

RUN npm install -g -U angular-cli

WORKDIR /go/src

RUN go get -u github.com/labstack/echo

RUN go get -u github.com/labstack/echo/middleware

RUN go get -u github.com/byu-oit/av-scheduling-ui

WORKDIR github.com/byu-oit/av-scheduling-ui/web/node_modules

RUN rm -fR *

WORKDIR github.com/byu-oit/av-scheduling-ui/web

RUN npm i

RUN ng build --aot --prod
