FROM elixir:1.9.4-alpine

RUN apk add --update npm

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new --force

RUN mkdir /app
COPY ./ /app
WORKDIR /app

RUN mix deps.get --force
RUN mix do compile --force
