# Build stage
FROM golang:1.14

RUN git clone https://github.com/kyverno/kyverno.git
WORKDIR kyverno
RUN make cli
RUN mv ./cmd/cli/kubectl-kyverno/kyverno /kyverno

RUN ls /

# Packaging stage
FROM gcr.io/distroless/base

COPY --from=0 --chown=nonroot:nonroot /kyverno /kyverno

USER nonroot

ENTRYPOINT ["/kyverno"]