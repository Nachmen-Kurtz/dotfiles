#!/usr/bin/env python3


import os
import shutil
import datetime


time_date = datetime.datetime.now().strftime("%d-%m-%y_%H:%M:%S")


backgrounds_dir = os.path.expanduser("~/Pictures/Backgrounds/")
source_file = os.path.expanduser("~/.config/background")
destination_file = os.path.join(backgrounds_dir, f"{time_date}.png")


shutil.copy(source_file, destination_file)


print("Success!")
