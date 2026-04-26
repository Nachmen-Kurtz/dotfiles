#!/bin/bash

for file in *; do
  if [[ -f "$file" && "$file" != *.mp3 && "$file" != *.jpg && "$file" != *.mp4 ]]; then
    mv "$file" "$file.mp3"
  fi
done
