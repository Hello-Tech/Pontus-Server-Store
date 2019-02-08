#!/bin/bash

function help(){
    echo "Usage : "
    echo "     bash run.sh server|client|test"
    echo "     e.g : bash run.sh server"
}

function server(){
    DIRPWD=`pwd`
    export GOPATH=$DIRPWD

    cd src/main
    go run server.go
}

function client(){
    DIRPWD=`pwd`
    export GOPATH=$DIRPWD

    cd src/main
    go run test_client.go
}

function test(){
    DIRPWD=`pwd`
    export GOPATH=$DIRPWD

    cd src/main
    go run test.go
}

case $1 in
    server)
        server
        ;;
    client)
        client
        ;;
    test)
        test
        ;;
    help)
        help
        exit 1;;
    ?)
        help
        exit 1;;
esac
