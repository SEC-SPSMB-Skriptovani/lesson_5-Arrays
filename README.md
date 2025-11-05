# Pole (Arrays) v Bash

## 🧠 Úvod
Pole (arrays) v Bash umožňují ukládat **více hodnot do jedné proměnné**.  
Místo vytváření mnoha proměnných (`name1`, `name2`, `name3`…) můžeš všechny hodnoty uchovávat přehledně v jednom poli.  
Hodí se například pro seznamy souborů, jmen, čísel nebo argumentů.

---

## Video YT:
**Bash Arrays explained — Learn Linux scripting!**  
[![YOUTUBE - Bash Arrays](https://img.youtube.com/vi/asHJ-xfuyno/0.jpg)](https://www.youtube.com/watch?v=asHJ-xfuyno)

@see also: [https://www.youtube.com/results?search_query=bash+arrays](https://www.youtube.com/results?search_query=bash+arrays)

## Definování polí

Pole se definuje pomocí závorek `()` a hodnoty se oddělují mezerami.
### Syntaxe
Inicializace pole prázdná, nebo s předáním hodnot.
```bash
array=()
array=(hodnota1 hodnota2 hodnota3 ...)
```

### Výpis pole:
```bash
echo "${array[@]}"
echo "${#array[@]}" // výpis délky pole
```

### Příklad
```bash
fruits=('Apple' 'Banana' 'Orange')

# výpis pole
echo ${fruits[@]}

# nebo jednotlivě
fruits[0]="Apple"
fruits[1]="Banana"
fruits[2]="Orange"
```

---

## Přístup k prvkům pole

| Příklad | Popis |
|----------|-------|
| `${fruits[0]}` | První prvek („Apple“) |
| `${fruits[-1]}` | Poslední prvek |
| `${fruits[@]}` | Všechny prvky oddělené mezerou |
| `${!fruits[@]}` | Všechny indexy (klíče) |
| `${#fruits[@]}` | Počet prvků v poli |
| `${#fruits}` | Délka prvního prvku (řetězce) |
| `${#fruits[3]}` | Délka konkrétního prvku |
| `${fruits[@]:3:2}` | Výřez pole – od pozice 3, délka 2 |

### Ukázka
```bash
echo "${fruits[0]}"     # Element #0
echo "${fruits[-1]}"    # Last element
echo "${fruits[-2]}"    # Second last element
echo "${fruits[@]}"     # All elements
echo "${#fruits[@]}"    # Number of elements
echo "${#fruits}"       # String length of 1st element
echo "${#fruits[3]}"    # String length of element #3
echo "${fruits[@]:3:2}" # Range (from 3, length 2)
echo "${!fruits[@]}"    # Indexes
```

---

## Operace s poli

| Operace | Popis | Příklad |
|----------|--------|---------|
| **Přidání (push)** | Přidání prvku na konec pole | `fruits=("${fruits[@]}" "Watermelon")`<br>`fruits+=('Watermelon')` |
| **Odebrání podle vzoru (regex)** | Odebere prvky odpovídající vzoru | `fruits=("${fruits[@]/Ap*/}")` |
| **Smazání prvku podle indexu** | | `unset fruits[2]` |
| **Duplikace pole** | | `fruits=("${fruits[@]}")` |
| **Spojení dvou polí** | | `fruits=("${fruits[@]}" "${Veggies[@]}")` |
| **Načtení z textového souboru** | rozdělí podle IFS | `words=($(< datafile))` |

---

## Iterace přes pole

```bash
for i in "${fruits[@]}"; do
  echo "$i"
done
```

---

## Délka pole a indexy

```bash
echo "Počet prvků: ${#fruits[@]}"
echo "Indexy: ${!fruits[@]}"
```

---

## Odstranění prvků nebo celého pole

| Příkaz | Význam |
|---------|---------|
| `unset 'fruits[1]'` | odstraní prvek s indexem 1 |
| `unset fruits` | odstraní celé pole |

---

## 🧩 Asociativní pole (od Bash 4+)

Asociativní pole fungují jako „slovník“ (klíč → hodnota).

### Deklarace
```bash
declare -A capitals
```

### Naplnění
```bash
capitals=( ["CZ"]="Praha" ["SK"]="Bratislava" ["PL"]="Varšava" )
```

### Použití
```bash
echo ${capitals["CZ"]}
```

### Smyčka
```bash
for country in "${!capitals[@]}"; do
  echo "$country → ${capitals[$country]}"
done
```

---

## Ukázkový skript

Soubor: `pole.sh`
```bash
#!/bin/bash

fruits=('Apple' 'Banana' 'Orange')

echo "První: ${fruits[0]}"
echo "Poslední: ${fruits[-1]}"
echo "Počet: ${#fruits[@]}"

# Přidání prvku
fruits+=('Watermelon')

# Výpis všech
for fruit in "${fruits[@]}"; do
  echo "Ovoce: $fruit"
done

# Asociativní pole
declare -A capitals=( ["CZ"]="Praha" ["SK"]="Bratislava" )
echo "Hlavní město ČR: ${capitals["CZ"]}"
```

Spusť:
```bash
bash pole.sh
```

---

## Cvičení 🎯
1. Definuj pole `Animals` se čtyřmi názvy zvířat.  
2. Přidej do pole páté zvíře.  
3. Vypiš druhý prvek.  
4. Zjisti počet prvků.  
5. Pomocí smyčky `for` vypiš všechny záznamy.  
6. Smaž třetí prvek.  
7. Vytvoř asociativní pole `countries` (země → hlavní město) a vypiš všechny dvojice.
