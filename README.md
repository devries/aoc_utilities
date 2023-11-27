# Advent of Code Utilities

These are some utilities I use during advent of code. Feel free to take a look
and use/modify them if you find them useful.

- `aoc download` downloads your input from the advent of code website.
- `aoc leaderboard` downloads the specified leaderboard from the website.
- `aoc scores` will create a pretty text rendering of the JSON leaderboard file.

Bash completion is available by adding

~~~~~
eval "$(aoc completion)"
~~~~~

to your .bashrc file.

## Good Citizenship
These utilities identify themselves to the Advent of Code server in accordance
with [automation guidelines](https://www.reddit.com/r/adventofcode/wiki/faqs/automation).
Please do your part by following the rules below:

- Direct the output of the download and leaderboard commands to a file so it is
  cached. For example to download your day's input, use the command:
  ~~~~~
  aoc download > day01-input.txt
  ~~~~~

- Aim to download each day's input only once. On occasion there may be an issue
  that requires that you download it twice, but this should be rare.
- Do not download the leaderboard more than once every 15 minutes.

Thank you for keeping the load on Advent of Code's servers to a minimum.
