#!/bin/bash -e

set -o pipefail

ubuntu_releases="precise trusty xenial bionic"
packer_cwd=/ssd/packer
vagrant_cwd=/ssd/vagrant

export ubuntu_releases

cd $packer_cwd

[ ! -e $packer_cwd/tmp ] && mkdir -p $packer_cwd

for r in $ubuntu_releases
do
 echo Building $r
 TMPDIR=./tmp ./packer build qemu-ubuntu-${r}.json | tee -a /tmp/vagrant_image_rebuild.log
 vagrant box list | grep -q $r && vagrant box remove ubuntu-${r} 
 vagrant box add $packer_cwd/boxes/qemu-ubuntu-${r}-libvirt.box --name ubuntu-${r} --force | tee -a /tmp/vagrant_image_rebuild.log
done
