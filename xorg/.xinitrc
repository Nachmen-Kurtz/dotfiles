#!/bin/sh

xrdb -merge ~/.Xresources
exec qtile start
