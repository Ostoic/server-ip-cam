#!/bin/bash
EYEHOST="10.179.205.142"

function capture-eye() {
  EYEDIR=$(date "+%d.%m.%y")
  if [[ ! -d $EYEDIR ]]; then
    mkdir $EYEDIR
  fi

  curl --silent -o "$EYEDIR/eye-$(date "+%s").jpg" "http://$1/capture"
}

while true; do
  capture-eye $EYEHOST
  sleep 1
done
