## --- BUILD PHASE --- ##
FROM golang:1.16-buster AS build
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o /basic-api

## --- DEPLOY PHASE --- ##
FROM gcr.io/distroless/base-debian10
WORKDIR /
COPY --from=build /basic-api /basic-api
EXPOSE 8080
USER nonroot:nonroot
ENTRYPOINT [ "/basic-api" ]