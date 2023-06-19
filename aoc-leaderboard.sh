#!/bin/sh

year=$(date +'%Y')
leaderboard=@@DEFAULT_LEADERBOARD@@

show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo "  -h         show help"
  echo "  -y int     leaderboard for given year (default $year)"
  echo "  -l int     leaderboard number (default $leaderboard)"
}

if [ -z "${AOC_SESSION}" ]; then
  echo "Must set AOC_SESSION environment variable to the session string."
  show_help
  exit 1
fi

while getopts "y:l:h" opt;
do case $opt in
  h) show_help 
      exit 0;;
  y) year=$OPTARG ;;
  l) leaderboard=$OPTARG ;;
esac
done

curl -A "github.com/devries/aoc_utilities by devries@idolstarastronomer.com" --cookie session=${AOC_SESSION} https://adventofcode.com/$year/leaderboard/private/view/$leaderboard.json