#!/bin/bash

# Déclarer les questions et les réponses dans un tableau associatif
declare -A questions=(
  ["1"]="Quelle commande Git permet de voir l'historique des commits ?"
  ["2"]="Comment changer l'auteur et l'adresse e-mail d'un commit en Git ?"
  ["3"]="Comment supprimer une branche locale en Git ?"
  ["4"]="Comment résoudre les conflits de fusion en Git ?"
  ["5"]="Quelle commande permet d'afficher l'état du dépôt Git local par rapport au dépôt distant ?"
  ["6"]="Comment mettre à jour un dépôt distant avec les modifications locales en Git ?"
  ["7"]="Quelle est la commande pour créer un alias dans Git ?"
  ["8"]="Comment rechercher un commit spécifique dans l'historique des commits en Git ?"
  ["9"]="Comment changer le message d'un commit déjà poussé sur le dépôt distant en Git ?"
  ["10"]="Quelle commande permet de compresser l'historique des commits en Git ?"
  ["11"]="Comment créer un nouvel utilisateur dans Linux ?"
  ["12"]="Quelle commande permet de redémarrer un service dans Linux ?"
  ["13"]="Comment afficher les informations système dans Linux ?"
  ["14"]="Quelle commande permet de supprimer un dossier et son contenu dans Linux ?"
  ["15"]="Comment créer un nouveau répertoire dans Linux ?"
  ["16"]="Comment copier un fichier ou un dossier dans Linux ?"
  ["17"]="Quelle commande permet de déplacer un fichier ou un dossier dans Linux ?"
  ["18"]="Comment rechercher des fichiers par nom dans Linux ?"
  ["19"]="Comment compter le nombre de lignes, de mots et de caractères d'un fichier dans Linux ?"
  ["20"]="Comment mettre à jour les paquets installés sur une distribution Linux basée sur Debian ?"
)

declare -A answers=(
  ["1"]="git log"
  ["2"]="git commit --amend --author='Auteur <email>'"
  ["3"]="git branch -d nom_de_la_branche"
  ["4"]="Éditez manuellement les fichiers en conflit, puis utilisez 'git add' et 'git commit' pour valider les modifications."
  ["5"]="git status"
  ["6"]="git push"
  ["7"]="git config --global alias.alias_name 'command_to_run'"
  ["8"]="git log --grep='texte_du_commit'"
  ["9"]="Utilisez 'git commit --amend', puis 'git push --force' pour forcer la mise à jour."
  ["10"]="git rebase -i"
  ["11"]="sudo adduser nom_utilisateur"
  ["12"]="sudo systemctl restart nom_du_service"
  ["13"]="uname -a"
  ["14"]="rm -r dossier"
  ["15"]="mkdir nom_du_dossier"
  ["16"]="cp source destination"
  ["17"]="mv source destination"
  ["18"]="find /chemin/du/dossier -name nom_du_fichier"
  ["19"]="wc fichier"
  ["20"]="sudo apt update && sudo apt upgrade"
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