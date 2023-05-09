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
# définir les mots-clés pour chaque réponse
declare -A keywords=(
  ["1"]="git log"
  ["2"]="git commit --amend author"
  ["3"]="git branch -d"
  ["4"]="git add et commit"
  ["5"]="git status"
  ["6"]="git push"
  ["7"]="git config --global"
  ["8"]="git log --grep"
  ["9"]="git commit --amend push"
  ["10"]="git rebase"
  ["11"]="adduser"
  ["12"]="systemctl restart"
  ["13"]="uname -a"
  ["14"]="rm"
  ["15"]="mkdir"
  ["16"]="cp"
  ["17"]="mv"
  ["18"]="find -name"
  ["19"]="wc"
  ["20"]="apt update upgrade"
)


# Récupérer la réponse utilisateur passée en argument
value=$1

# Récupérer la clé de la question actuelle
concept=$2
question=${questions[$concept]}

# Récupérer la réponse prédéfinie correspondant à la question actuelle
answer=${answers[$concept]}

# Vérifier si la réponse utilisateur est correcte ou non
if [[ "$value" == "$answer" ]]; then
    # Afficher "correct" et passer une nouvelle question
    echo "Réponse correcte!,$(bash /home/ubuntu/LynaMOSTEFACHAA-Python-Git-Linux-Rattrapage/RandomQuestion.sh)"
else
    # Séparer les mots de la chaîne "value" en utilisant l'espace comme délimiteur
    IFS=' ' read -ra words <<< "$value"

    # Récupérer la liste des mots-clés correspondant à "concept"
    keywords_list="${keywords[$concept]}"

    # Séparer les mots-clés en utilisant l'espace comme délimiteur
    IFS=' ' read -ra keywords_array <<< "$keywords_list"

    # Initialiser une variable booléenne à "true"
    contains_all=true

    # Vérifier si chaque mot-clé est contenu dans la chaîne "value"
    for keyword in "${keywords_array[@]}"
      do
      # Initialiser une variable booléenne à "false" pour le mot-clé courant
      contains_keyword=false

      # Vérifier si le mot-clé est contenu dans la chaîne "value"
      for word in "${words[@]}"
        do
          if [[ "$word" == "$keyword" ]]
            then
            # Le mot-clé est trouvé dans la chaîne "value"
            contains_keyword=true
            break
          fi
        done

      # Si le mot-clé courant n'est pas trouvé dans la chaîne "value", alors la variable booléenne contient_all est mise à "false"
      if [[ "$contains_keyword" == "false" ]]
       then
        contains_all=false
      break
      fi
done


# Afficher le résultat de la vérification
if [[ "$contains_all" == "true" ]]
then
  echo "Bonne réponse! La réponse exacte était : $answer,$(bash /home/ubuntu/LynaMOSTEFACHAA-Python-Git-Linux-Rattrapage/RandomQuestion.sh)"
else
  echo "Réponse incorrecte. Veuillez réessayer.,$question,$concept"
fi

fi