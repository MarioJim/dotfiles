#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 REPOSITORY" >&2
  exit 1
fi

case $1 in
    git@*)
        GIT_USER=$(echo "$1" | sed 's/:/\//g' | cut -d '/' -f2)
        ;;
    http*)
        GIT_USER=$(echo "$1" | cut -d '/' -f4)
        ;;
    *)
        echo "Git protocol not recognized, aborting..."
        exit 1
esac

CLONING_INTO_DIR="$HOME/GitHub/$GIT_USER"
mkdir -p "$CLONING_INTO_DIR"
cd "$CLONING_INTO_DIR" || exit 1

git clone "$1"

echo "Your cloned repo is in $CLONING_INTO_DIR"
