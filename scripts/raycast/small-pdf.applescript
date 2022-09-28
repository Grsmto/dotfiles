#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Small PDF
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName smallPdf

# Documentation:
# @raycast.description Compress PDF file
# @raycast.author Gromy
# @raycast.authorURL https://github.com/Grsmto

set variable to (do shell script "pbpaste")

do shell script "/usr/local/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -dColorImageResolution=150 -sOutputFile=" & variable & "-compressed.pdf '" & variable & "'"
