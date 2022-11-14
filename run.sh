#!/bin/sh

_REPEATEVERY=${REPEATEVERY:-0}
_TARGET=${TARGET:-"/mnt"}
_SOURCE=${SOURCE:-"/mnt"}
_ACTION=${ACTION:-"copy"}
_EXTRA=${EXTRA:-""}

_CONFIG=""

if [ -f /rclone.conf ]; then
	_CONFIG=" --config /rclone.conf"
fi

if [ "$SOURCE" == "$TARGET" ]; then
	echo "Variables \$SOURCE and \$TARGET have the same value";
	exit -1
fi

rclone $_CONFIG $_ACTION $_SOURCE $_TARGET $_EXTRA
echo "$ACTION is complete: $(date)"
while [ "$_REPEATEVERY" -gt "0" ]
do
	sleep $_REPEATEVERY;
	rclone $_CONFIG $_ACTION $_SOURCE $_TARGET $_EXTRA
	echo "$ACTION is complete: $(date)"
done
