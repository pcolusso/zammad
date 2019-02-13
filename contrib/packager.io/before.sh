#!/bin/bash
#
# packager.io before script
#

# print environemnt
uname -a
ruby -v
env
cat Gemfile.lock

# cleanup
script/build/cleanup.sh

rpm -ql imlib2
rpm -ql imlib2-devel