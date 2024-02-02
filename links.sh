#!/bin/bash
# Skrypt Bash wykonujący szereg operacji na katalogach i plikach.(Skrypt stworzony w celu praktyki Basha)

# Tworzy katalog.
mkdir $1

# Przechodzi do nowo utworzonego katalogu i tworzy podkatalogi oraz pliki.
cd $1
mkdir D1
mkdir D2
touch D2/F1.txt

mkdir D3
touch D3/F1.txt

mkdir D4
touch D4/F1.txt

# Tworzy dowiązanie symboliczne.
ln -s /etc/passwd D1

# Wyświetla ścieżkę docelową dowiązania symbolicznego.
readlink D1/passwd

# Tworzy twarde dowiązanie do pliku.
ln D3/F1.txt D2/F2.txt

# Ustawia uprawnienia do zapisu tylko dla właściciela pliku.
chmod 600 D2/F2.txt

# Zmienia właściciela i grupę pliku.
chown student: D2/F2.txt

# Zmienia grupę katalogu.
chgrp student D3

# Usuwa uprawnienia do wykonywania dla wszystkich.
chmod a-x D3

# Usuwa uprawnienia do zapisu dla wszystkich.
chmod a-w D2

# Usuwa uprawnienia do odczytu dla wszystkich.
chmod a-r D4

# Ustawia flagę sticky bit dla katalogu.
chmod a+t D4

# Tworzy plik i nadaje uprawnienia.
touch D1/src1.sh
chmod ug+x D1/src1.sh
chmod o-x D1/src1.sh

# Ustawia bit setuid i setgid dla pliku.
chmod u+s D1/src1.sh
chmod g+s D1/src1.sh
