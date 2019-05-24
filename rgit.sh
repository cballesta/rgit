#!/bin/bash
WHITESPACE="[[:space:]]"
GREEN='\033[92m'
YELLOW='\033[93m'
CYAN='\033[36m'
BOLD='\e[1m'
NC='\033[0m'
CMD='git '

if [ $# -eq 0 ]; then
  CMD=$CMD'status --short --branch'
else
  for arg in "$@"
  do
      if [[ $arg =~ $WHITESPACE ]]
      then
        arg=\"$arg\"
      fi
      CMD=$CMD$arg" "
  done
fi

ORIGIN_PATH=$(pwd)

for d in $(find . -type d -not \( -path "*/node_modules/*" -prune \) -name .git); do
    cd $d/..
    CURPATH=$(pwd)
    echo -e "${BOLD}${CYAN}$CMD${NC}on ${GREEN}$CURPATH${NC}"
    bash -c "$CMD"
    cd $ORIGIN_PATH
done

exit 0

