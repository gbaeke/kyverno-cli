FROM golang:1.16 as build

COPY src/ /

RUN git clone https://github.com/kyverno/kyverno.git
WORKDIR kyverno
RUN make cli
RUN mv ./cmd/cli/kubectl-kyverno/kyverno /kyverno


FROM alpine:3.8

RUN apk add --no-cache bash
RUN apk add libc6-compat

COPY --from=build /kyverno /usr/bin/kyverno
COPY --from=build /entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

