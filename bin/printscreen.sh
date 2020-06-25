#!/bin/sh

# Printscreen with selected area
maim -s | xclip -selection clipboard -t image/png
