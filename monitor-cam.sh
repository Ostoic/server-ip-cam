#!/bin/bash
EYEHOST="10.179.205.142"

function capture-eye() {
  EYEDIR="pictures/$(date "+%d.%m.%y")"
  OUTPATH="$EYEDIR/eye-$(date "+%s").jpg"
  if [[ ! -d "$EYEDIR" ]]; then
    mkdir "$EYEDIR"
  fi

  if [[ ! -f $OUTPATH ]] ; then
    curl --silent -o $OUTPATH "http://$1/capture"
    echo "Saved to $OUTPATH"
  fi
}

while true; do
  capture-eye $EYEHOST
  sleep 0.5
done
