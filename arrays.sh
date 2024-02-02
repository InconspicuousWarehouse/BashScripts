#!/bin/bash

# Funkcja bubbleSort - Sortuje tablicę.
# Funkcja multiplicationTab - Tworzy tablicę mnożenia.
# Funkcja integration - Oblicza całkę.

# Funkcja bubbleSort
bubbleSort(){
    tablica=("$@")
    n=$#

    # Sprawdzenie czy wszystkie argumenty są liczbami całkowitymi
    for ((i=0; i<$#; i++)); do
        if ! [[ ${!i} =~ ^[0-9]+$ ]]; then         
            echo "Liczba na pozycji $((i+1)) nie jest całkowita"
            exit 1
        fi
    done

    # Sortowanie tablicy za pomocą algorytmu sortowania bąbelkowego
    for ((i=0; i < n-1; i++)); do
        for ((j=0; j < n-i-1; j++)); do
            if (( ${tablica[j]} > ${tablica[j+1]} )); then
                temp=${tablica[j]}
                tablica[j]=${tablica[j+1]}
                tablica[j+1]=$temp
            fi
        done
    done

    # Wyświetlenie posortowanej tablicy
    echo "Zadanie 0 - Sortowanie bąbelkowe"
    echo "Posortowana tablica: ${tablica[@]}"
}

# Funkcja multiplicationTab
multiplicationTab(){
    if (( $# != 2 )); then
        echo "Podaj dwie liczby jako argumenty"
        exit 1
    fi 
    if (( $1 <= 0 )) || (( $2 <= 0 )); then
        echo "Podaj liczby dodatnie jako argumenty"
        exit 1
    fi

    rows=$1
    cols=$2
    tablica=()

    # Wypełnienie tablicy wartościami wyników mnożenia indeksów
    for ((i=0; i < rows; i++)); do
        for ((j=0; j < cols; j++)); do
            tablica[i*cols + j]=$(( (i+1)*(j+1) ))
        done
    done

    # Wyświetlenie tablicy
    echo "Zadanie 1 - Tablica mnożenia"
    for ((i=0; i < rows; i++)); do
        for ((j=0; j < cols; j++)); do
            echo -n "${tablica[i*cols + j]} "
        done
        echo ""
    done
}

#Funkcja integration
integration(){
    tablica=("$@")
    n=${#tablica[@]}

    if (( n < 3 )); then
        echo "Podaj conajmniej 3 wartości"
        exit 1 
    fi

    suma=0

    # Obliczenie całki metodą trapezów
    for ((i=0; i < n-1; i++)); do
        h=$(bc <<< "${tablica[i+1]}-${tablica[i]}")
        suma=$(bc <<< "$suma + ($h/2)* (${tablica[i+1]}+${tablica[i]})")
    done

    # Wyświetlenie wyniku całkowania
    echo "Zadanie 2 - Całkowanie metodą trapezów"
    echo "Wynik całkowania: $suma"
}

bubbleSort 1 2 4 3
multiplicationTab 3 4
integration 1 2 3
