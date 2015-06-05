#!/bin/bash

CMD=$@

if [ $# -eq 0 ]; then
  CMD='status'
fi

GREEN='\033[32m'
NC='\033[0m'

ORIGIN_PATH=$(pwd)

for d in $(find . -type d -name .git); do
    cd $d/..
    CURPATH=$(pwd)
    echo -e "git "$CMD" on "${GREEN}$CURPATH${NC}
    git $CMD
    cd $ORIGIN_PATH
done

exit 0

