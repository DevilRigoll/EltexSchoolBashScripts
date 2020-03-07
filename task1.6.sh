#!/usr/bin/env bash

cat ./alarm.sh | tr "[:upper:]" "[:lower:]" | tr "[:space:][:punct:]" "\n" | sort | uniq -c | sort -nr
