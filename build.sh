#!/bin/bash -eu

if [ ! -d brod ]; then
  git clone https://github.com/klarna/brod.git
fi
cd brod
GIT_DESC=$(git describe --tag)
VSN=$(echo $GIT_DESC | grep -E '^[0-9]*\.[0-9]*\.[0-9]*$' || true)
if [ -z $VSN ]; then
  echo "Not building $GIT_DESC"
  exit 0
fi
echo "building $VSN"
make brod-cli
cd ..

LIB=zmstone

docker build --build-arg BROD_VSN=$VSN -t $LIB/brod:$VSN .
docker tag $LIB/brod:$VSN $LIB/brod:latest

docker push $LIB/brod:$VSN
docker push $LIB/brod:latest

