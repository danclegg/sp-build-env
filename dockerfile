FROM byuoitav/build-env:master
MAINTAINER danclegg <dgclegg@byu.edu>

RUN apk update
RUN apk upgrade

RUN apk add nodejs nodejs-npm

RUN npm install -g -U npm

WORKDIR /go/src

RUN gvt fetch --branch=master github.com/byu-oit/av-scheduling-ui

RUN go get -u github.com/byu-oit/av-scheduling-ui

WORKDIR github.com/byu-oit/av-scheduling-ui
