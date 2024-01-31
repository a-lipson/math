#!/bin/bash

wd=$1 # comes from ${fileDirname} in code tasks

# get snippet for tex-code-snippets
snippet_name="setup subfile document"
title_completion="\${1:root file}"

snippet_body=$(jq -r ".\"$snippet_name\".body[]" .vscode/tex.code-snippets)

project_dir=""
project_file=""

# check if cur dir is 'sections' or has a 'sections' subdir
if [[ $(basename "$wd") == "sections" ]]; then
    sections_dir="$wd"
    project_dir=$(dirname "$wd")
elif [[ -d "$wd/sections" ]]; then
    project_dir="$wd"
    sections_dir="$wd/sections"
else
    echo "$wd:0:0:error: no 'sections' directory found" >&2
    exit 1
fi

# find the .tex project file in the parent directory
project_file=$(find "$project_dir" -maxdepth 1 -type f -name "*.tex" -exec basename {} .tex \;)

# check if project file was found
if [[ -z "$project_file" ]]; then
    echo "$project_dir:0:0:error: project file not found" >&2
    exit 1
fi

cd "$sections_dir"

# find next file name
next_num=1
while [[ -e "$sections_dir/$next_num.tex" || -e "$sections_dir/${next_num}*.tex" ]]; do
    ((next_num++))
done

# replace '${1:title}' with $project_file
body=$(echo "$snippet_body" | sed "s#$title_completion#$project_file#g")

# create file or report error if unable
if ! echo "$body" > "$sections_dir/$next_num.tex"; then
    echo "$dir/$next_num.tex:0:0:error: unable to create next section" >&2
    exit 1
fi