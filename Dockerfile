FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY . /app
CMD mix deps.get && mix phx.server
