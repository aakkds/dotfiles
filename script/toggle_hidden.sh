#!/bin/bash

window_id=$(xdotool search --name $1)
tmp_id=0

for x in $(bspc query -N -n .hidden)
do
	tmp_id=$(printf "%d\n" $x)
	if [ $tmp_id == $window_id ]; then
		hidden=true
		break
	fi
done

if [ "$hidden" = true ]; then
	bspc node $window_id -g hidden=off
	xdotool windowactivate --sync $window_id
else
	bspc node $window_id -g hidden=on
fi
