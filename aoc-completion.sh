_aoc_completion() {
  local cmd

  if [[ "$COMP_CWORD" -lt "2" ]]
  then
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -W "download leaderboard scores start" -- "$cur"))
    return
  fi

  cmd=${COMP_WORDS[1]}

  case "$cmd" in
    download) _aoc_download_completion ;;
    leaderboard) _aoc_leaderboard_completion ;;
    scores) _aoc_scores_completion ;;
    start) _aoc_start_completion ;;
  esac
}

_aoc_download_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "-d --day -h --help -y --year" -- "$cur"))
}

_aoc_leaderboard_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "-h -y -l" -- "$cur"))
}

_aoc_scores_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -f -- "$cur"))
}

_aoc_start_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "-d --day -h --help -y --year" -- "$cur"))
}

complete -F _aoc_completion aoc

