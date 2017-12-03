#!/usr/bin/osascript
on run argv
set theFileList to {}
repeat with i from 1 to count of argv
       set theFile to (alias (POSIX file (item i of argv) as text))
       set theFileList to theFileList & theFile
end repeat
tell application "Emacsclient" to open theFileList
end run
