!/bin/bash

df -m $PWD | awk '/[0-9]%/{print $(NF-2)}'
