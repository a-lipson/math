#!/bin/bash

wd=${1}
# echo "bash cwd:${PWD}"
# echo "code cwd:${1}"

# Check if current directory is sections or has a sections subdirectory
if [[ $(basename "$wd") == "sections" ]]; then
    dir="$wd"
elif [[ -d "$wd/sections" ]]; then
    dir="$wd/sections"
    cd "$dir"
else
    echo "$PWD:0:0:error: No 'sections' directory found" >&2
    exit 1
fi

# Finding the next file name
next_num=1
while [[ -e "$dir/$next_num.tex" || -e "$dir/${next_num}*.tex" ]]; do
    ((next_num++))
done

# Create the file or report an error if unable
if ! touch "$dir/$next_num.tex"; then
    echo "$dir/$next_num.tex:1:1:error: Unable to create next section" >&2
    exit 1
fi