#!/bin/bash

./add-timestamp.py $1
ffmpeg -framerate 1 -pattern_type glob -i "$1/eyets-*.jpg" "$1.mp4"
