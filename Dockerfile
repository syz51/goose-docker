FROM golang:1.22.5-alpine as base

RUN go install github.com/pressly/goose/v3/cmd/goose@latest


FROM gcr.io/distroless/static-debian12:nonroot

COPY --from=base /go/bin/goose /app/goose

ENV PATH="/app:${PATH}"

ENTRYPOINT ["goose"]