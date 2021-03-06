#!/bin/bash
MBOXES=(LFO)

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
  echo "No new mail"
  exit 0
else
  echo "$STATUS"
  exit 33
fi
