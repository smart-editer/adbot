FROM debian:trixie-slim

WORKDIR /app

COPY ./adbot ./adbot
COPY .env ./.env

RUN chmod +x ./adbot

ENTRYPOINT ["./adbot"]
