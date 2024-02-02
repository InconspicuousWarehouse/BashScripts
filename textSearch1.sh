#!/bin/bash

# Wyszukuje i wyświetla szesnastkowe liczby zapisane w formacie 0xABCDEF w podanym pliku.
echo "zad 1"
grep -oP '(?<=^|\s)\b0x[a-fA-F0-9]+(?!\S)' $1

# Wyszukuje i wyświetla adresy email w podanym pliku.
echo "zad 2"
grep -oP '(?<=^|\s)[a-zA-Z0-9,\.\:\;]+@[a-zA-Z0-9.-]+(\.[a-zA-Z]+)+(?=\s|$)' $1

# Wyszukuje i wyświetla liczby zmiennoprzecinkowe w podanym pliku.
echo "zad 3"
grep -oP '(?<=^|\s)[+-]?\d*\.\d+(?=\s|$)' $1
