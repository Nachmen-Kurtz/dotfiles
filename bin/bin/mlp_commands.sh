#!/bin/bash

# הרצת עדכונים עם fwupdmgr
sudo fwupdmgr update > fwupdmgr_update_output
sudo fwupdmgr get-updates > fwupdmgr_get_update_output

# קבלת מידע על כרטיס הרשת
sudo lspci | grep -i network > network_card

# אריזת כל הקבצים לארכיב טאר
tar -cvf output_files_for_nachmen.tar fwupdmgr_update_output fwupdmgr_get_update_output network_card

