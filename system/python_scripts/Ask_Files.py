import os

ask = input("whay file you do need?\n")

if os.path.isfile(ask):
    print("yes, I Have this file!")
else:
    print("sory, I dont have this file...")
