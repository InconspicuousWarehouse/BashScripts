#!/bin/bash

# Funkcja wykonująca dzielenie dwóch liczb.
# Argumenty: $1 - dzielna, $2 - dzielnik
division(){
    if [ "$#" != 2 ]; then
        echo "Błąd: nieprawidłowa liczba argumentów"
        exit 1
    fi
    if [ $2 -eq 0 ]; then
        echo "Błąd: Mianownik równy zero"
        exit 1
    fi 
    result=$((($1 + $2) / ($1 - $2)))
    echo $result
}
echo "Dzielenie 4 przez 2:"
division 4 2

# Funkcja obliczająca silnię rekurencyjnie.
# Argument: $1 - liczba dla której ma zostać obliczona silnia
factorialRec(){
    if [ "$#" != 1 ]; then
        echo "Błąd: nieprawidłowa liczba argumentów"
        exit 1
    fi
    
    if [ $1 -le 1 ]; then
        echo 1
    else
        result=$(($1 * $(factorialRec $(($1-1)))))
        echo $result
    fi
}
echo "Silnia z 6 (rekurencyjnie):"
factorialRec 6

# Funkcja obliczająca silnię iteracyjnie.
# Argument: $1 - liczba dla której ma zostać obliczona silnia
factorialIter(){
    if [ "$#" != 1 ]; then
        echo "Funkcja wymaga jednej liczby"
        return 1
    fi

    if [ $1 -lt 2 ]; then
        echo 1
    else
        result=1
        for ((iter=2; iter<=$1; iter++)); do
            result=$((result * iter))
        done
        echo $result
    fi
}
echo "Silnia z 5 (iteracyjnie):"
factorialIter 5

# Funkcja sumująca podane argumenty.
# Argumenty: liczby całkowite do zsumowania
sumArgs(){
    result=0
    for n in "$@"; do
        if [[ $n =~ ^[+-]?[0-9]+$ ]]; then
            (( result += n ))
        else
            echo "Liczba $n nie jest liczbą całkowitą"
        fi        
    done
    echo $result
}
echo "Suma argumentów 1, 1, 1:"
sumArgs 1 1 1
