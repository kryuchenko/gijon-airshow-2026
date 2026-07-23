#!/bin/sh
# Stamp a cache-busting content hash on local asset links in index.html.
# GitHub Pages serves files with max-age=600; a new ?v= makes the browser
# fetch the updated asset as soon as it sees the fresh index.html.
set -e
cd "$(dirname "$0")"
v=$(shasum theme.css | cut -c1-8)
sed -i '' -E "s|theme\.css(\?v=[0-9a-f]*)?\"|theme.css?v=$v\"|" index.html
echo "theme.css -> ?v=$v"
