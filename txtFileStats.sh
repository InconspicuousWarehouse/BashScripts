#!/bin/bash

# Wyświetla kodowanie MIME pliku.
# $1 - ścieżka do pliku
file --mime-encoding $1

# Liczy ilość linii w podanym pliku.
wc -l $1

# Liczy ilość znaków w pliku.
wc -m $1

# Wyświetla rozmiar pliku w czytelnej formie.
du -h $1

# Liczy ilość linii zawierających określony wzorzec w pliku.
# $1 - ścieżka do pliku
# $2 - wzorzec do wyszukania
grep ".*$2.*" $1 | wc -l 

# Liczy ilość linii niezawierających określonego wzorca w pliku.
# $1 - ścieżka do pliku
# $2 - wzorzec do pominięcia
grep  -v "$2" $1 | wc -l

# Wyświetla piątą linię pliku.
# $1 - ścieżka do pliku
cat $1 | head -n 5| tail -n 1
