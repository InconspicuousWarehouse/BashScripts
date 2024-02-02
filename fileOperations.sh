#!/bin/bash

# Funkcja dzieląca linie losowo na dwa pliki.
split_lines_randomly() {
    src_file=$1
    output_file1=$2
    output_file2=$3

    if [ ! -r "$src_file" ]; then
        echo "Brak uprawnień do odczytu pliku źródłowego."
        exit -1
    fi

    touch "$output_file1" "$output_file2"

    if [ ! -w "$output_file1" ] || [ ! -w "$output_file2" ]; then
        echo "Brak uprawnień do zapisu do plików wyjściowych."
        exit -1
    fi

    > "$output_file1"
    > "$output_file2"

    while IFS= read -r line; do
        random=$((RANDOM % 2))
        if [ "$random" -eq 0 ]; then
            echo "$line" >> "$output_file1"
        else
            echo "$line" >> "$output_file2"
        fi
    done < "$src_file"
}

# Funkcja tworząca strukturę katalogów na podstawie pliku z listą katalogów.
create_directory_structure() {
    target_dir=$1
    dirs_file=$2

    if [ ! -d "$target_dir" ]; then
        echo "Podana ścieżka nie wskazuje na katalog."
        exit -1
    fi

    if [ ! -x "$target_dir" ]; then
        echo "Brak uprawnień do utworzenia katalogów w podanej lokalizacji."
        exit -1
    fi

    if [ ! -r "$dirs_file" ]; then
        echo "Brak uprawnień do odczytu pliku z listą katalogów."
        exit -1
    fi

    while IFS= read -r dir; do
        mkdir -p "$target_dir/$dir"
    done < "$dirs_file"
}

split_lines_randomly "src_file.txt" "wyjscie1.txt" "wyjscie2.txt"
create_directory_structure "./katalog" "./katalog/lista_katalogow.txt"
