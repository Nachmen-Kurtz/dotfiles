#!/bin/bash

# 1
echo "What directory do you want to refactor?"
read dir_ref
~
# 2
if [ ! -d "$dir_ref" ]; then
    echo "Directory $dir_ref does not exist."
    exit 1
fi

# 3
temp_dir=$(mktemp -d /tmp/refactor_XXXXXX)

# 4
cp -r "$dir_ref" "$temp_dir/"

# 5
find "$temp_dir/$(basename "$dir_ref")" -type l -exec rm {} \;

# 6
echo "Where do you want to move the refactored directory?"
read new_place

# 7
if [ ! -d "$new_place" ]; then
    mkdir -p "$new_place"
fi

# 8
cp -r "$temp_dir/$(basename "$dir_ref")" "$new_place/"

# 9
rm -rf "$temp_dir"

# 10
echo "Directory refactored and moved to $new_place successfully."


# רעיונות הסקריפט:
#
# 1. נתינת שם לוקאלי - בסקריפט - לכתובת התיקייה שברצונך לסדר
# 2. להעתיקה לתיקייהה זמנית לצורך סידור וארגון מחדש
# 3. מחיקת כל קבצי הלינקים באמצעות מציאה ומחיקה
# 4. להעתיק את התיקייה המסודרת למיקום החדש שהמשתמש יבקש.
