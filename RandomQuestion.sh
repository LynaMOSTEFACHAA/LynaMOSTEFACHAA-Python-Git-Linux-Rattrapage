#!/bin/bash

# Déclarer les questions et les réponses dans un tableau associatif
declare -A questions=(
  ["Git"]="Qu'est-ce qu'un commit en Git?"
  ["Python"]="Quelle est la différence entre une liste et un tuple en Python?"
  ["Linux"]="Quelle est la commande pour changer les permissions d'un fichier en Linux?"
)

declare -A answers=(
  ["Git"]="Un commit est une sauvegarde des modifications apportées à un fichier ou un ensemble de fichiers dans un référentiel Git."
  ["Python"]="Une liste est mutable (modifiable), tandis qu'un tuple est immuable (non modifiable)."
  ["Linux"]="La commande pour changer les permissions d'un fichier en Linux est chmod."
)

# Fonction pour obtenir une question aléatoire
get_random_question() {
  # Sélectionner une clé (concept) aléatoire
  local concepts=("${!questions[@]}")
  local random_index=$((RANDOM % ${#concepts[@]}))
  local concept=${concepts[$random_index]}

  # Récupérer la question correspondante
  local question=${questions[$concept]}

  # Retourner la question et le concept
  echo "$question,$concept"
}

get_random_question