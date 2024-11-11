#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <path to the input file>"
    exit 1
fi

input_file=$1

# Check if the input file ends with .md
if [[ $input_file != *.md ]]; then
    echo "[-] The input file must be a markdown file"
    exit 1
fi

if [ ! -f $input_file ]; then
    echo "[-] The input file does not exist"
    exit 1
fi

# Get the output file name
output_file=${input_file%.md}.docx

echo "[*] Converting $input_file to $output_file"
pandoc $input_file -o $output_file --reference-doc=reference.docx