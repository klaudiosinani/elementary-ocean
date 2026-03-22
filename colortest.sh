#!/usr/bin/env bash
# Terminal color test — prints a grid of foreground/background ANSI combinations
# Similar to the classic terminal color chart

T='gYw'

printf "%16s" ''
for bg in 40m 41m 42m 43m 44m 45m 46m 47m; do
  printf "  %-6s" "$bg"
done
echo

for fg in '' 'm' '1m' '30m' '1;30m' '31m' '1;31m' '32m' '1;32m' '33m' '1;33m' '34m' '1;34m' '35m' '1;35m' '36m' '1;36m' '37m' '1;37m'; do
  if [ -z "$fg" ]; then
    label='def'
  else
    label="$fg"
  fi
  printf "%8s  \033[%s  %s  \033[0m" "$label" "${fg:-0m}" "$T"

  for bg in 40m 41m 42m 43m 44m 45m 46m 47m; do
    if [ -z "$fg" ]; then
      printf "  \033[%s  %s  \033[0m" "$bg" "$T"
    else
      printf "  \033[%s\033[%s  %s  \033[0m" "$fg" "$bg" "$T"
    fi
  done
  echo
done
