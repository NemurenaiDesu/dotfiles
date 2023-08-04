#!/bin/bash

layoutStatusFile="/tmp/keyboard-layout-status"

printLayout() {
    echo "{\"text\":\"$(python -u  ~/.config/hypr/scripts/KeyboardLayout.py get)\"}"
}

printLayout
while inotifywait -e modify "$layoutStatusFile" &> /dev/null; do
    printLayout
done