#!/bin/bash

basepath=$(cd `dirname $0`; pwd)

build_cache_path=${basepath}"/.build_proto_cache"

mkdir ${build_cache_path}

if [ ! -d "$build_cache_path" ] ; then
	mkdir "$build_cache_path"
fi
cd ${build_cache_path}

python -m grpc_tools.protoc -I../protos --python_out=. --grpc_python_out=. ../protos/common.proto


python -m grpc_tools.protoc -I../protos --python_out=. --grpc_python_out=. ../protos/device.proto
cp -f device_pb2.py ../app/service/device/
cp -f device_pb2_grpc.py ../app/service/device/

python -m grpc_tools.protoc -I../protos --python_out=. --grpc_python_out=. ../protos/user.proto
cp -f user_pb2.py ../app/service/user/
cp -f user_pb2_grpc.py ../app/service/user/

python -m grpc_tools.protoc -I../protos --python_out=. --grpc_python_out=. ../protos/token.proto
cp -f token_pb2.py ../app/service/token/
cp -f token_pb2_grpc.py ../app/service/token/


rm -rf ${build_cache_path}
