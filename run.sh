#!/bin/bash

DIRPWD=`pwd`
export GOPATH=$DIRPWD

cd src/main
go run test.go