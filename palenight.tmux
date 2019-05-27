#!/usr/bin/env bash

PALENIGHT_TMUX_COLOR_THEME_FILE="theme/palenight.conf"
PALENIGHT_TMUX_STATUS_CONTENT_FILE="theme/palenight-status-content.conf"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v PALENIGHT_TMUX_COLOR_THEME_FILE PALENIGHT_TMUX_VERSION
  unset -v PALENIGHT_TMUX_STATUS_CONTENT_FILE
  unset -v CURRENT_DIR
  unset -f __load __cleanup __source
}

__load() {
  __source "$CURRENT_DIR/$PALENIGHT_TMUX_COLOR_THEME_FILE"
  __source "$CURRENT_DIR/$PALENIGHT_TMUX_STATUS_CONTENT_FILE"
}

__source() {
  test -z $1 || tmux source-file -q "$1"
}

__load
__cleanup
