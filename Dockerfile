FROM golang:alpine

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

ENV GOPATH /go

ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apk add --no-cache ca-certificates git \
    && mkdir -p "$GOPATH/src" "$GOPATH/bin" \
    && go get -u github.com/derekparker/delve/cmd/dlv

WORKDIR $GOPATH/src/app

COPY go.mod .

RUN go mod download

COPY . .

CMD ["dlv", "debug", "--headless", "--listen=:2345", "--api-version=2"]
