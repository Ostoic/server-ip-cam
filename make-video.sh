#!/bin/bash

if python3 add-timestamp.py $1 ; then
  #rm "$1"/eye-*.jpg
  ffmpeg -framerate 1 -pattern_type glob -i "$1/eyets-*.jpg" "$1.mp4"
  rm "$1"/eyets-*.jpg
else
  echo "Error making video"
fi
