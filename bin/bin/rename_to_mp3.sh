#!/bin/bash

for file in *; do
  # Check if file has no extension
  if [[ ! "$file" =~ \.[a-zA-Z0-9]+$ ]]; then
    mv "$file" "$file.mp3"
    echo "Renamed: $file to $file.mp3"
  fi
done
echo "All files hav been processed"
