#! /bin/bash

if [ ! -z  $(iwgetid -r) ]; then
 echo "$(iwgetid -r)"
else
 echo "no network"
fi
