#! /bin/bash
free -m | grep -oP '\d+' | head -n 1
