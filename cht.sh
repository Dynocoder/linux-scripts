#!/usr/bin/env bash

languages=$(echo "python c cpp typescript lua javascript" | tr " " "\n")
core_utils=$(echo "find xargs awk sed" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Query: " query

if echo $languages | grep -qs $selected; then
  tmux split-window -h -l 35% bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
  tmux split-window -h -l 35% bash -c "curl cht.sh/$selected~$query | less"
fi
