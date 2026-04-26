import os

items = os.listdir(os.getcwd())

directorys = [d for d in items if os.path.isdir(d)]

for directory in directorys:
    print(directory)
