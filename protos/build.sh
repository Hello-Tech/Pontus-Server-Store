#!/bin/bash

protoc --go_out=plugins=grpc:. common.proto
protoc --go_out=plugins=grpc:. device.proto
protoc --go_out=plugins=grpc:. token.proto
protoc --go_out=plugins=grpc:. user.proto

cp *.pb.go 