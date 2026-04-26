import os
from datetime import datetime

project = os.getcwd() # ~/Developer/Python

to_day_now = datetime.now() # 2024-09-05 02:19:43.165709

w_day = to_day_now.weekday() # the current day of week. monthey = 0, sanday = 6

sisi = 4 # fryday

if w_day == sisi:
    print("gut sabes")
else:
    print("to day you work of", project, "progedt")
