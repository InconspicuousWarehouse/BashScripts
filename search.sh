#!/bin/bash

# Skrypt wykonujący operacje na katalogach i plikach.

# Tworzy katalog z podaną ścieżką.
echo "zad1"
mkdir $2 -p

# Znajduje pliki tekstowe w podanej lokalizacji.
echo "zad2"
find $1 -type f -name "*.txt"

# Tworzy katalog z nazwą zawierającą litery "a", "A", "b", lub "B".
echo "zad3"
mkdir "$1/Acha Bcoś bcoś acoś"
find $1 -type d -name "[aAbB]*"

# Znajduje pliki skryptowe, do których właściciel ma uprawnienie do wykonania.
echo "zad4"
find $1 -type f -name "*.sh" -perm /a=x

# Znajduje pliki puste, których właścicielem jest student.
echo "zad5"
find $1 -type f -empty -user student

# Znajduje dowiązania symboliczne.
echo "zad6"
find $1 -type l

# Znajduje pliki, których grupa jest "student" i rozmiar jest mniejszy niż 1 megabajt.
echo "zad7"
find $1 -type f -group student -size -1M

# Znajduje pliki wykonywalne, których bit setuid lub setgid jest ustawiony.
echo "zad8"
find $1 -type f \( -perm /4000 -o -perm /2000 \) -perm /a=x

# Tworzy katalog z ustawioną flagą sticky bit i znajduje katalogi z ustawionym sticky bit.
echo "zad9"
mkdir $1/sticki
chmod $1/sticki +s
find $1 -type d -perm /1000

# Znajduje pliki zmodyfikowane w ciągu ostatniej godziny.
echo "zad10"
find $1 -type f -mmin -60

# Znajduje urządzenia znakowe lub katalogi w /dev.
echo "zad11"
find "/dev" -type c -o -type d

# Usuwa puste katalogi.
echo "zad12"
find -type d -empty -exec rmdir {} \;

# Znajduje pliki większe niż 10 megabajtów i przenosi je do podanej lokalizacji.
echo "zad13"
find -type f -size +10M -exec mv '{}' $2 \;

# Kopiuje katalogi o nazwach rozpoczynających się od "Z" do podanej lokalizacji i wyświetla ich zawartość.
echo "zad14"
find -type d -name "Z*" -exec cp -r '{}' $2 \;
ls $2
