#!/bin/sh

region="$(slurp)"

#grim -g "$region" ~/screenshots/$(date +'screenshot_%d-%m-%y:%H_%M_%S.png')

grim -g "$region" "${XDG_PICTURES_DIR}/ss/$(date +'screenshot_%s.png')
grim -g "$region" - | wl-copy

