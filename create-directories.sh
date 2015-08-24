#!/bin/bash

declare -a roles=("common" "lb" "web")
declare -a directories=("handlers" "tasks" "templates")

for role in "${roles[@]}"
do
  for directory in "${directories[@]}"
  do
    eval "mkdir -p ansible/roles/$role/$directory"
  done
done
