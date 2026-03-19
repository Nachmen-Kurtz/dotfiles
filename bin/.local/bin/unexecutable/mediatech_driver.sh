#!/bin/bash

sudo mkdir -p /usr/lib/firmware

unzip mediatek.zip

cd mediatek

sudo mv * /usr/lib/firmware

reboot
