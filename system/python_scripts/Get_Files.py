import os


items = os.listdir(os.getcwd())

files = [f for f in items if os.path.isfile(f)]


for file in files:
    print(file)
