FROM golang:1.22.5-alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go build -o /main

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /main .

EXPOSE 8080

CMD ["./main"]
