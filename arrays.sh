#!/bin/bash

# Definice nového pole
array=("Apple" "Banana" "Orange" "Grapes")
echo "${array[@]}" # výpis prvků v poli

# Přidání dalšího prvku na konec pole
array+=("Watermelon")
echo "${array[@]}" # výpis upraveného pole
echo "${#array[@]}" # výpis počtu prvků v poli (length)

# Vytořte cyklus který vypíše hodnoty ve formátu:
# [index] --> hodnota
# ukázka: [0] --> Apple
#         [1] --> Banana
#         [2] --> Orange
#         [3] --> Grapes
#         [4] --> Watermelon
for i in "${!array[@]}"; do
  echo "[$i]  --> ${array[$i]}"
done

# Editace prvku v poli
array[0]="Raspberry"
echo "${array[@]}"


echo "výpis části pole"
echo "${array[@]:2:3}" # vypíše část pole  (od indexu 2, celkem 3 prvky)


# výpis obsahu složky:
echo "Výpis obsahu složky:"
files=(/home/student/scripts/*)
echo "${files[@]}"

for file in "${files[@]}"; do
  cat $file | grep "pravda"
done

declare -A capitals
capitals=( ["CZ"]="Praha" ["SK"]="Bratislava" ["PL"]="Varšava" )
echo "${capitals[@]}"
echo ${capitals["CZ"]}