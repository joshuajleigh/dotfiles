#!/bin/bash

BAT_STATE=$(upower -i $(upower -e | grep 'BAT') | grep "state" | awk '{print $2}')
BAT_PER=$(upower -i $(upower -e | grep 'BAT') | grep "percentage" | awk '{print $2}')

BAT_LABEL="--"
if [ $BAT_STATE = "charging" ]; then
        BAT_LABEL="++"
fi

echo "BAT:$BAT_LABEL$BAT_PER"
