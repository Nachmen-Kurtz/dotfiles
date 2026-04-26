#!/bin/bash

source "$HOME/.system/shell_config/env_var.zsh"
# סקריפט שמחפש את כל קבצי הפודקאסטים שהורדתי ביום האחרון
# ומעתיק אותם לתיקייה חדשה בשם היום הנוכחי
# בתוך הנגן שלי

# יצירת משתנה עבור שם התיקייה העתידית

# יצירת התיקייה בכונן הנייד
# שימו לב:
# יש להחליף את שם המשתמש ושם הכונן הנייד כפי שמופיע בתיקייה
mkdir "/run/media/nachmen/9C33-6BBD/gPodder/$DATE"

# חיפוש כל הקבצי הפודקאסטים והעתקתם לתיקייה החדשה
find ~/gPodder \
  -type f \
  -ctime -2 \
  -name "*.mp3" \
  -exec cp -t /run/media/nachmen/9C33-6BBD/gPodder/$DATE/ {} +
