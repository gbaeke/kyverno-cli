# Build stage
FROM golang:1.14 AS builder

LABEL maintainer="Kyverno"

WORKDIR /kyverno

ADD main.go /kyverno


RUN export GOOS=linux && \
    export GOARCH=amd64

RUN go get github.com/kyverno/kyverno/pkg/kyverno

RUN CGO_ENABLED=0 go build -o /output/kyverno -v main.go

# Packaging stage
FROM scratch

LABEL maintainer="Kyverno"

COPY --from=builder /output/kyverno /
COPY --from=builder /etc/passwd /etc/passwd

USER 10001

ENTRYPOINT ["./kyverno"]