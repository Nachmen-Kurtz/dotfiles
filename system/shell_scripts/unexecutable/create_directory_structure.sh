#!/bin/bash

# יצירת התיקיות הראשיות
mkdir -p ~/new_tre/dev/{projects,git,scripts}
mkdir -p ~/new_tre/media/{music,pictures,videos,gPodder}
mkdir -p ~/new_tre/docs/templates
mkdir -p ~/new_tre/sys/{bin,aws,snap,logs,services}
mkdir -p ~/new_tre/downloads
mkdir -p ~/new_tre/desktop
mkdir -p ~/new_tre/vm

# יצירת תיקיות משנה נוספות לפי מבנה העץ
mkdir -p ~/new_tre/sys/services/logs
touch ~/new_tre/sys/aliases  # קובץ לקיצורי פקודות

echo "מבנה התיקיות נוצר בהצלחה."

