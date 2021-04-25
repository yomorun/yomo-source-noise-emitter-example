FROM golang:buster

RUN apt-get update && \
    apt-get install nano iputils-ping telnet net-tools ifstat -y

WORKDIR $GOPATH/src/github.com/yomorun/yomo-source-noise-emiter-example
COPY main.go go.mod ./
RUN go get -d -v ./...

CMD ["sh", "-c", "go run main.go"]
