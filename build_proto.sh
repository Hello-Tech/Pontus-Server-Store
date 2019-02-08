#!/bin/bash

basepath=$(cd `dirname $0`; pwd)

build_cache_path=${basepath}"/.build_proto_cache"

mkdir ${build_cache_path}

if [ ! -d "$build_cache_path" ] ; then
	mkdir "$build_cache_path"
fi
cd ${build_cache_path}

protoc --go_out=plugins=grpc:. helloworld.proto 


rm -rf ${build_cache_path}
