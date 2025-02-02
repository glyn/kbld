#!/bin/bash

set -e -x -u

BUILD_VALUES= ./hack/build.sh

GOOS=darwin GOARCH=amd64 go build -o kbld-darwin-amd64 ./cmd/kbld/...
GOOS=linux GOARCH=amd64 go build -o kbld-linux-amd64 ./cmd/kbld/...
GOOS=windows GOARCH=amd64 go build -o kbld-windows-amd64.exe ./cmd/kbld/...

shasum -a 256 ./kbld-*-amd64*
