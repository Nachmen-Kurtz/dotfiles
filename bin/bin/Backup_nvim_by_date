#!/usr/bin/env python3


import os
import shutil
import datetime


time_date = datetime.datetime.now().strftime("%d-%m-%y_%H:%M:%S")


paths = [
    "~/.config/nvim",
    "~/.local/share/nvim",
    "~/.local/state/nvim",
    "~/.cache/nvim",
]


for path in paths:
    full_path = os.path.expanduser(path)
    if os.path.exists(full_path):
        shutil.move(full_path, f"{full_path}.{time_date}")


print("Success!")
