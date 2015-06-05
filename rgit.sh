#!/bin/bash

CMD=$@

if [ $# -eq 0 ]; then
  CMD='status'
fi

GREEN='\033[32m'
NC='\033[0m'

for d in $(find ./ -mindepth 1 -maxdepth 1 -type d); do
  if ! [[ "$d" =~ ^\./\..* ]]; then
    echo -e "git "$CMD" on "${GREEN}$d${NC}
    cd $d
    git $CMD
    cd ..
  fi
done

exit 0


