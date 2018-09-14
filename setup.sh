#!/bin/bash

dir=$(unset CDPATH && cd "$(dirname "$0")" && echo $PWD)

case "`uname`" in
  CYGWIN* | Linux*)  ln="ln -sfn" ;;
  Darwin*) ln="ln -sfh" ;;
  *) echo "ln file fails, pls link it manaully."; exit 0 ;;
esac

$ln $dir/.vimrc $HOME/.vimrc
$ln $dir/.vim $HOME/.vim

echo "OK!"
