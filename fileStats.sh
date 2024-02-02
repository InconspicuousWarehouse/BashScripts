#!/bin/bash
# Skrypt Bash zliczający wystąpienia poszczególnych słów w pliku źródłowym
# oraz zapisujący wyniki w pliku docelowym, posortowanych malejąco według liczby wystąpień.

if [ "$#" -ne 2 ]; then
    echo "Sposób użycia: $0 <plik_wejściowy> <plik_docelowy>"
    exit -1
fi

source_file="$1"
destination_file="$2"

if [ ! -r "$source_file" ]; then
    echo "Plik źródłowy nie istnieje lub nie masz uprawnień do jego odczytu."
    exit -1
fi

if [ -e "$destination_file" ]; then
    if [ ! -w "$destination_file" ] || [ ! -r "$destination_file" ]; then
        echo "Plik docelowy istnieje, ale nie masz uprawnień do zapisu lub odczytu."
        exit -1
    fi
else
    touch "$destination_file" || { echo "Nie można utworzyć pliku docelowego."; exit -1; }
fi

declare -A word_count

while IFS= read -r -d ' ' word; do
    trimmed_word=$(echo "$word" | sed -e 's/^[[:blank:]]*//' -e 's/[[:blank:]]*$//')
    ((word_count["$trimmed_word"]++))
done < "$source_file"

sorted_word_count=$(for word in "${!word_count[@]}"; do echo "$word ${word_count["$word"]}"; done | sort -k2,2nr)

echo "$sorted_word_count" > "$destination_file"
