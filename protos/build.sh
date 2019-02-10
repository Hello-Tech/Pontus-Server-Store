#!/bin/bash

if [ ! -f build.sh ]; then
    echo 'build.sh must be run within its container folder' 1>&2
    exit 1
fi

protoc --go_out=plugins=grpc:. common.proto
protoc --go_out=plugins=grpc:. device.proto
protoc --go_out=plugins=grpc:. token.proto
protoc --go_out=plugins=grpc:. user.proto

mkdir ../src/pontus_store_pb
rm ../src/pontus_store_pb/*.pb.go

cp *.pb.go ../src/pontus_store_pb/

rm *.pb.go