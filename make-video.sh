#!/bin/bash

if python3 add-timestamp.py "pictures/$1" ; then
  #rm "$1"/eye-*.jpg
  ffmpeg -framerate 1 -pattern_type glob -i "pictures/$1/eyets-*.jpg" "videos/$1.mp4"
  rm "pictures/$1"/eyets-*.jpg
else
  echo "Error making video"
fi
