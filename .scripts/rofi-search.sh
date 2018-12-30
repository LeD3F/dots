#!/bin/bash
# Rofi Script for search through DuckDuckGo.


URL='https://duckduckgo.com/?q='
QUERY=$(cat ~/.cache/search_history | rofi -lines 3 -theme ~/.cache/wal/flat-red.rasi -dmenu -i -p  "search:")
if [ -n "$QUERY" ]; then
    grep -q "$QUERY"  "$HOME/.cache/search_history"
    echo $QUERY >> ~/.cache/search_history_temp && sort -u ~/.cache/search_history_temp > ~/.cache/search_history
  xdg-open "${URL}${QUERY}" 2> /dev/null
fi
