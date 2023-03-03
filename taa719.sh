#!/bin/bash
echo "Poisk failov"
echo "Tsoy Aleksey"
echo "Programma dlya poiska failov po imeni i razmeru"
while true
        do
        echo -n "Vvedite katalog, nachal'nyj put': "
        read place
        if !(ls $place) ; then
                echo "Katalog ne naiden. Povtorite dejstvie"
                continue
                fi
        echo "Vyberite rezhim raboty: 1 - poisk po imeni faila, 2 - poisk po razmeru: "
        read action
        if [ $action -eq 1 ]
        then
        echo -n "Vvedite imya faila: "
        read name
        find $place -name "$name"
        elif [ $action -eq 2 ]
        then
        echo -n "vvedite razmer faila (v baitah): "
        read size
        if !(echo "$size" | grep -E -q "^?[0-9]+$") ; then
                echo "Error! Nedopustimye simvoly!"
                continue
        fi
        find $place -type f -size +"$size"c
        else
        echo "Error! Nedopystimaya komanda!"
fi
echo -n "Na4at snova vypolnenie. Vvod 'n' - zakonchit, drugoy symbol - prodolzhit' "
read y
if [ $y = 'n' ]
then
break
fi
done