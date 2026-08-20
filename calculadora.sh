#!/bin/bash
while true
do
echo                  "Calculadora Cientifica"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicacion"
echo "4. Division"
echo "5. Raiz a la N"
echo "6. Seno"
echo "7. Coseno"
echo "8. Tangente"
echo "9. Logaritmo"
echo "10. Potencia"
echo "11. Logaritmo natural"
echo "12. Valor Absoluto"
echo "13. Exponencial"
echo "14. Factorial"
echo "15. Arcoseno"
echo "16. Arcocoseno"
echo "17. Arcotangente"
echo "0. Salir"

read -p "opcion: " opcion

case $opcion in

1)
    read -p "Ingrese el Primer Numero: " a
    read -p "Ingrese el Segundo Numero: " b
    resultado=$(echo "$a + $b" | bc -l)
    echo "El resultado es:" $resultado
    ;;

2)
    read -p "Ingrese el Primer Numero: " a
    read -p "Ingrese el Segundo Numero: " b
    resultado=$(echo  "$a - $b" | bc -l)
    echo "El resultado es:" $resultado
    ;;

3)
    read -p "Ingrese el Primer Numero: " a
    read -p "Ingrese el Segundo Numero: " b
    resultado=$(echo "$a * $b" | bc -l)
    echo "El resultado es: " $resultado
    ;;
4)
    read -p "Ingrese el Primer Numero: " a
    read -p "Ingrese el Segundo Numero: " b
    resultado=$(echo "scale=2; $a / $b" | bc -l)
    echo "El resultado es: " $resultado
    ;;

5)
    read -p "Ingrese el Numero: " a
    read -p "Ingrese el Indice de la raiz: " n
    resultado=$(echo "scale=4; e(l($a) / $n)" | bc -l)
    echo "La raiz $n del numero $a es: " $resultado
    ;;

6)
    read -p "Angulo en grados: " a
    resultado=$(echo "scale=4; s($a* 3.14159265358 / 180)" | bc -l)
    echo "El seno es: $resultado"
    ;;

7)
    read -p "Angulo en Grados: " a
    resultado=$(echo "c($a* 3.14159265359 / 180)" | bc -l)
    echo "El coseno es: $resultado"
    ;;


8)
   read -p "Angulo en Grados:" a
   resultado=$(echo "scale=4; s($a * 3.14159265359 / 180) / c($a * 3.14159265359 / 180)" | bc -l)
   echo "La tangente es: $resultado"
   ;;

9)
   echo "Ingrese el número:"
    read x

    if (( x <= 0 )); then
        echo "Error: el número tiene ser mayor que 0"
    else
        resultado=$(echo "scale=4; l($x) / l(10)" | bc -l)
        echo "log($x) = $resultado"
    fi
    ;;

10)
    echo "Ingrese la base:"
    read base
    echo "Ingrese el exponente:"
    read exponente
    resultado=$(echo "scale=4; $base^$exponente" | bc -l)
    echo "$base^$exponente = $resultado"
    ;;



11)
    echo "Ingrese el número:"
    read x
    if (( x <= 0 )); then
        echo "Error: el número debe ser mayor que 0"
    else
        resultado=$(echo "scale=4; l($x)" | bc -l)
        echo "log($x) = "  $resultado
    fi
    ;;

12)
   read -p "Ingrese el Numero: " a
   resultado=$(echo "define abs(x){ if(x<0) return  -x; return x }; abs($a)" | bc -l)
   echo "El Valor absoluto es: " $resultado
   ;;

13)

    echo "Ingrese el exponente:"
    read x
    resultado=$(echo "scale=4; e($x)" | bc -l)
    echo "e^$x = $resultado"
    ;;

14)
   echo "Ingrese un número entero:"
    read n

    if (( n < 0 )); then
        echo "Error: en factorial no existen números negativos"
    else
        factorial=1
        for (( i=1; i<=n; i++ ))
        do
            factorial=$((factorial * i))
        done
        echo "$n! = $factorial"
    fi
    ;;

15)
    echo "Ingrese el valor:"
    read x
    if (( $(echo "$x < -1 || $x > 1" | bc -l) )); then
        echo "Error: el valor debe estar entre -1 y 1"
    elif (( $(echo "$x == 1" | bc -l) )); then
        echo "arcsin($x) = 90 grados"
    elif (( $(echo "$x == -1" | bc -l) )); then
        echo "arcsin($x) = -90 grados"
    else
        resultado=$(echo "scale=4; a($x / sqrt(1-$x^2)) * 180 / 3.14159265359" | bc -l)
        echo "arcsin($x) = $resultado grados"
    fi
    ;;
16)

    echo "Ingrese el valor:"
    read x
    if (( $(echo "$x < -1 || $x > 1" | bc -l) )); then
        echo "Error: el valor debe estar entre -1 y 1"
    elif (( $(echo "$x == 1" | bc -l) )); then
        echo "arccos($x) = 0 grados"
    elif (( $(echo "$x == -1" | bc -l) )); then
        echo "arccos($x) = 180 grados"
    else
        resultado=$(echo "scale=4; 90 - (a($x / sqrt(1-$x^2)) * 180 / 3.141592653589793)" | bc -l)
        echo "arccos($x) = $resultado grados"
    fi
    ;;
17)
    echo "Ingrese el valor:"
    read x
    resultado=$(echo "scale=20; a($x) * 180 / 3.14159265359" | bc -l)
    echo "arctan($x) = $resultado grados"
    ;;

0)
   echo "Salir"
   break
   ;;


  esac
done
