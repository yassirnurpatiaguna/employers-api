#!/bin/bash
# wait-for-it.sh script to wait for the database to be ready before starting the app

HOST=$1
PORT=$2
shift 2
cmd="$@"

until nc -z $HOST $PORT; do
  echo "Waiting for $HOST:$PORT to be available..."
  sleep 2
done

echo "$HOST:$PORT is available. Starting application..."
exec $cmd
