#!/bin/bash

set -x 

target=~/.vimrc
if [ -e $target ];then
    mv $target $target.bak$(date +%s)
fi

cp .vimrc $target
