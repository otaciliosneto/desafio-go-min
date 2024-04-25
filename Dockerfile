FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go build -ldflags '-s -w' hello-world.go


#imagem minima
FROM scratch

COPY --from=builder /go/src/app/hello-world /usr/local/bin/hello-world

CMD [ "hello-world" ]