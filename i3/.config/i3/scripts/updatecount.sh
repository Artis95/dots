#! /bin/bash
if [ "$(/usr/lib/update-notifier/apt-check --human-readable |head -n 1 | tr -dc '0-9')" == "0" ]; then
  echo "no updates"
else echo "$(/usr/lib/update-notifier/apt-check --human-readable |head -n 1 | tr -dc '0-9') updates"
fi
