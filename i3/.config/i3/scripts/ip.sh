#! /bin/bash

if [ ! -z  $(ifconfig wlp3s0 | grep 'inet:' | cut -d: -f2 | awk '{ print $1}') ]; then
 echo "$(ifconfig wlp3s0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')"
elif  [ ! -z  $(ifconfig enp0s25 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}') ]; then
 echo "$(ifconfig enp0s25 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')"s
  else echo "no ip"
fi
