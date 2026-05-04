#!/bin/sh

if grep -q "Adwaita-dark" ~/.xsettingsd; then
    sed -i 's/Adwaita-dark/Adwaita/; s/WhiteSur-dark/WhiteSur/' ~/.xsettingsd
else
    sed -i 's/Adwaita/Adwaita-dark/; s/WhiteSur/WhiteSur-dark/' ~/.xsettingsd
fi

pkill -HUP xsettingsd
