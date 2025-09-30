FROM golang:1.21-alpine AS builder

WORKDIR /build

COPY app/main.go .

RUN go build -o terraform-studies main.go

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /build/terraform-studies .

EXPOSE 8080

CMD ["./terraform-studies"]

