#!/usr/bin/env bash

MAIL_CHECK() {
  MBOXES=(ex2mutt)
  STATUS=""
  for m in "${MBOXES[@]}"; do
    COUNT=$(find ~/Maildir/$m/INBOX/new -type f | wc -l)
    if [ $COUNT -gt 0 ];
    then
      STATUS="$STATUS $m[$COUNT]"
    fi
  done
  if [ "" == "$STATUS" ];
  then
    echo "No mail"
    exit 0
  else
    echo "#[bg=red]$STATUS#[bg=black]"
    exit 33
  fi
}

COLORIZE() {
  BACK=#[fg=white]
  if (( $(bc <<< "$1 >= $3") )); then
    FRONT=#[fg=red]
  elif (( $(bc <<< "$1 >= $2") )); then
    FRONT=#[fg=yellow]
  else
    FRONT=#[fg=white]
  fi
  echo "$FRONT$1$BACK "
}

REV_COLORIZE() {
  BACK=#[fg=white]
  if (( $(bc <<< "$1 <= $3") )); then
    FRONT=#[fg=red]
  elif (( $(bc <<< "$1 <= $2") )); then
    FRONT=#[fg=yellow]
  else
    FRONT=#[fg=green]
  fi
  echo "$FRONT$1$BACK "
}
CHECK_LOAD() {
  LOAD1=$(uptime | grep -oP '(?<=average:).*' | awk -F',' '{print $1}')
  LOAD5=$(uptime | grep -oP '(?<=average:).*' | awk -F',' '{print $2}')
  LOAD15=$(uptime | grep -oP '(?<=average:).*' | awk -F',' '{print $2}')
#  for i in $LOAD1 $LOAD5 $LOAD15; do
#    OUTPUT+=$(COLORIZE $i)
#  done
#  echo "$OUTPUT"
echo "$(COLORIZE $LOAD1 2 3)"
}

GET_BATTERY_LEVEL(){
  BATTERY_LEVEL=$(cat /sys/class/power_supply/$1/capacity)
  echo "$1:$(REV_COLORIZE $BATTERY_LEVEL 70 20)"
}

GET_ALL_BATTERY_LEVEL(){
  declare -a BATS=($(ls /sys/class/power_supply/ | grep BAT))
  for i in ${BATS[@]}; do
    ALL_BATS="$ALL_BATS$(GET_BATTERY_LEVEL $i)"
  done
  echo $ALL_BATS
}

DATE=$(date +'%a %D %R')
MAILZ=$(MAIL_CHECK)
BAT=$(GET_ALL_BATTERY_LEVEL)

echo "$MAILZ| $(CHECK_LOAD)|$DATE|$BAT"
