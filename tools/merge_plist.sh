#!/bin/bash
# set -x

# $1 is keypath to merge
# $2 is source plist
# #3 is dest plist

/usr/libexec/PlistBuddy -x -c "Print \"$1\"" "$2" >/tmp/com.hieplpvip.merge.plist
/usr/libexec/PlistBuddy -c "Merge /tmp/com.hieplpvip.merge.plist \"$1\"" "$3" > /dev/null
rm /tmp/com.hieplpvip.merge.plist
