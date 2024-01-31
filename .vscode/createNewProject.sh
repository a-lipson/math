#!/bin/bash

projectName=$1
projectType=$2

# get snippet for tex-code-snippets
snippet_name="setup root document"
title_completion="\${1:title}"

snippet_body=$(jq -r ".\"$snippet_name\".body[]" .vscode/tex.code-snippets)

body=$(echo "$snippet_body" | sed "s#$title_completion#Math 135 Homework $projectName#g") # fix hardcoded title

cd homework/135 # fix hardcoded location

mkdir $projectName && cd $projectName

mkdir sections 

echo "$body" > ${projectType}${projectName}.tex