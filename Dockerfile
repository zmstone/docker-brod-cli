FROM erlang:23-alpine as builder
ARG GIT_TAG=master

RUN apk update && apk upgrade && \
    apk add --no-cache bash git g++ make
RUN git clone -b ${GIT_TAG} https://github.com/klarna/brod.git /brod
WORKDIR /brod
RUN make brod-cli

FROM alpine:3
RUN apk update && apk upgrade && \
    apk add --no-cache ncurses-dev openssl-dev libstdc++
COPY --from=builder /brod/_build/brod_cli/rel/brod /brod
ENV PATH=$PATH:/brod/bin
