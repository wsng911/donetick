FROM golang:1.23-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git && \
    git config --global user.email "dev@example.com" && \
    git config --global user.name "dev"

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN git init && git add -A && git commit -m "init" || true

RUN CGO_ENABLED=0 GOOS=linux go build -o donetick ./main.go

FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache tzdata

COPY --from=builder /app/donetick ./donetick

RUN mkdir -p /app/data

ENV DONETICK_ENV=production

EXPOSE 2021

CMD ["./donetick"]
