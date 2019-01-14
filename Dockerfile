FROM ubuntu:latest

RUN apt-get update && apt-get install -y libssl-dev
COPY brod/_build/brod_cli/rel/brod /brod

ENV PATH /brod/bin:$PATH

