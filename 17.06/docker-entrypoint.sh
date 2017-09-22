#!/bin/sh

dockerd \
  --log-level=error \
  --host=unix:///var/run/docker.sock &

con_attempts=0
until docker info &>/dev/null;
do

  if [ $con_attempts -ge 5 ]; then
    echo "ERROR: can't connect to docker daemon!"
    exit 1
  fi

  con_attempts=`expr $con_attempts + 1`
  sleep 1
done

[[ $1 ]] && exec "$@"
exec sh
