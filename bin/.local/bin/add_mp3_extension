#!/usr/bin/env python3


import os


for file in os.listdir("."):
    if "." not in file:
        new_name = f"{file}.mp3"

        os.rename(file, new_name)

        print(f"Renamed: {file} to {new_name}")


print()
print("All files have been processed.")