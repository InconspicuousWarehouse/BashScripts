#!/bin/bash

# Tworzy katalog.
mkdir $1

# Wypisuje informacje o użytkowniku.
grep "^$(whoami)" /etc/passwd

# Tworzy plik CSV zawierający wybrane pola z pliku /etc/passwd, posortowane według pierwszej kolumny.
cut -d: -f1,6,7 /etc/passwd | sort -t: -k 1,1 -r > $1/F1.csv

# Tworzy plik CSV zawierający unikalne wartości siódmej kolumny z pliku /etc/passwd, posortowane alfabetycznie.
cut -d: -f7 /etc/passwd | uniq | rev | sort -k 1.1,1.2 | rev > $1/F2.csv

# Tworzy plik tekstowy zawierający nazwy użytkowników z pliku /etc/passwd zapisane z dużych liter.
cut -d: -f1 /etc/passwd | tr [:lower:] [:upper:] > $1/F3.txt

# Tworzy plik tekstowy zawierający wiersze z pliku /etc/passwd, w których występuje słowo "student", wraz z 4 wierszami przed i po znalezionym wierszu.
cat /etc/passwd | grep "student" -A 4 -B 4 > $1/F4.txt

# Porównuje plik /etc/passwd z utworzonym plikiem F4.txt i zapisuje różnice w pliku differences.txt.
diff -y /etc/passwd $1/F4.txt > $1/differences.txt
