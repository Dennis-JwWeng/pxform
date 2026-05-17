#!/bin/bash
# macOS: double-click this file to launch the PartFlow project page.
cd "$(dirname "$0")"
PORT=8000
while lsof -i :$PORT >/dev/null 2>&1; do PORT=$((PORT+1)); done
echo "Serving PartFlow page at http://localhost:$PORT  (press Ctrl+C to stop)"
( sleep 1; open "http://localhost:$PORT" ) &
python3 -m http.server $PORT
