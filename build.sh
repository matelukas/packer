#!/bin/sh -ex

mkdir ./tmp

for t in *.json
do
  TMPDIR=./tmp packer build $t
done
