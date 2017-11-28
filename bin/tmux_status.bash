#!/usr/bin/env bash

MAIL_CHECK() {
  MBOXES=(LFO)
  STATUS=""
  for m in "${MBOXES[@]}"; do
    COUNT=$(find ~/Repos/ex2mutt/Maildir/$m/INBOX/new -type f | wc -l)
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
  if (( $(bc <<< "$1 >= 3") )); then
    FRONT=#[fg=red]
  elif (( $(bc <<< "$1 >= 2") )); then
    FRONT=#[fg=yellow]
  else
    FRONT=#[fg=white]
  fi
  echo "$FRONT$1$BACK "
}

CHECK_LOAD() {
  LOAD1=$(uptime | awk '{print $11}'  | sed 's/,/ /g')
  LOAD5=$(uptime | awk '{print $12}' | sed 's/,/ /g')
  LOAD15=$(uptime | awk '{print $13}')
#  for i in $LOAD1 $LOAD5 $LOAD15; do
#    OUTPUT+=$(COLORIZE $i)
#  done
#  echo "$OUTPUT"
echo "$(COLORIZE $LOAD1)"
}

BAT=$(battery -t)
DATE=$(date +'%a %D %R')
MAILZ=$(MAIL_CHECK)

echo "$MAILZ| $(CHECK_LOAD)|$DATE|$BAT"
