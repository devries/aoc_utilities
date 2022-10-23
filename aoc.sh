#!/bin/sh

cmd=
case "$#" in 
  0) ;;
  *) cmd="$1"
    shift
    command -v aoc-$cmd >/dev/null 2>&1 && exec aoc-$cmd "$@"
    ;;
esac

echo "Usage: aoc COMNMAND [OPTIONS]"
if [ -n "$cmd" ]; then
  echo "  aoc command '$cmd' not found: commands are:"
else
  echo "  aoc commands are"
fi

cat <<\EOF
  download:    download your input
  leaderboard: download your leaderboard
  scores:      print out scores from leaderboard file
  start:       create skeleton code for an AoC problem
EOF
