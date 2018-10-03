#!/bin/bash
WHITESPACE="[[:space:]]"
GREEN='\033[32m'
NC='\033[0m'
CMD='git '

if [ $# -eq 0 ]; then
  CMD=$CMD'status '
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
    echo -e $CMD"on "${GREEN}$CURPATH${NC}
    bash -c "$CMD"
    cd $ORIGIN_PATH
done

exit 0

