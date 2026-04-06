FROM        docker.io/library/golang:1.26 AS builder
WORKDIR     /app
COPY        ./ /app/
RUN         CGO_ENABLED=0 go build -o auth-service ./cmd/server

FROM      docker.io/redhat/ubi9
COPY      /app/auth-service .
RUN       ./auth-service
