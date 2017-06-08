#!/bin/sh -ex

mkdir ./tmp || true

for t in *.json
do
  TMPDIR=./tmp packer build $t&
done
