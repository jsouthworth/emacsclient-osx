#!/usr/bin/osascript
to resolvePOSIXFilename from theFilename given workingDir:theWD
	set theFirstCharacter to (item 1 of theFilename)
	if theFirstCharacter is "/" then
		return theFilename
	end if
	return theWD & "/" & theFilename
end resolvePOSIXFilename

to getTheFilename for theFilename
	set theWD to do shell script "pwd"
	try
		return (POSIX path of (alias (POSIX file theFilename as text)))
	on error
		return resolvePOSIXFilename from theFilename given workingDir:theWD
	end try
end getTheFilename

on run argv
	set theFileList to {}
	repeat with i from 1 to count of argv
		set theFile to getTheFilename for (item i of argv)
		set theFileList to theFileList & theFile
	end repeat
	launch application "Emacsclient"
	tell application "Emacsclient" to openPOSIX from theFileList
end run
