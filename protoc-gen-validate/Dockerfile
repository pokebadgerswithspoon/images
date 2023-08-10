FROM golang:1.19-alpine3.15

ENV VERSION=v0.6.2
ENV PROTOC_GEN_GO_VERSION=v1.5.2
ENV GOPATH=/go
ENV GOPROXY=direct
RUN mkdir -p $GOPATH

RUN apk add --no-cache git make protoc protobuf-dev \
  && go install github.com/golang/protobuf/protoc-gen-go@${PROTOC_GEN_GO_VERSION}

RUN go get -d github.com/envoyproxy/protoc-gen-validate@${VERSION}
WORKDIR /go/pkg/mod/github.com/envoyproxy/protoc-gen-validate@${VERSION}
# https://github.com/envoyproxy/protoc-gen-validate/issues/503
RUN ln -s /usr/include/google google
RUN make build

WORKDIR /go/bin/

CMD ["/go/bin/protoc-gen-validate"]