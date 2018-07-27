FROM ubuntu:latest

COPY brod/_build/brod_cli/rel/brod /brod

ENV PATH /brod/bin:$PATH

