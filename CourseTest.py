import dash
from dash import html, dcc
import random
import subprocess


answers = {
  "1": "git log",
  "2": "git commit --amend --author='Auteur <email>'",
  "3": "git branch -d nom_de_la_branche",
  "4": "Éditez manuellement les fichiers en conflit, puis utilisez 'git add' et 'git commit' pour valider les modifications.",
  "5": "git status",
  "6": "git push",
  "7": "git config --global alias.alias_name 'command_to_run'",
  "8": "git log --grep='texte_du_commit'",
  "9": "Utilisez 'git commit --amend', puis 'git push --force' pour forcer la mise à jour.",
  "10": "git rebase -i",
  "11": "sudo adduser nom_utilisateur",
  "12": "sudo systemctl restart nom_du_service",
  "13": "uname -a",
  "14": "rm -r dossier",
  "15": "mkdir nom_du_dossier",
  "16": "cp source destination",
  "17": "mv source destination",
  "18": "find /chemin/du/dossier -name nom_du_fichier",
  "19": "wc fichier",
  "20": "sudo apt update && sudo apt upgrade"
}

def get_random_question():
    # Appeler le script bash et récupérer la sortie
    output = subprocess.check_output(['bash', '/home/ubuntu/LynaMOSTEFACHAA-Python-Git-Linux-Rattrapage/RandomQuestion.sh'])

    # Convertir la sortie en chaîne de caractères et la diviser en question et concept
    question, concept = output.decode("utf-8").strip().split(",")
    return question, concept

#Initialisation
question, concept = get_random_question()

app = dash.Dash(__name__)

app.layout = html.Div([
    html.H1("Questionnaire de test de connaissances"),
    html.H2(id="concept-header", children=["Question n°", html.Span(id="concept", children=concept)]),
    html.P(id="question", children=question),
    dcc.Input(id="answer-input", type="text", placeholder="Entrez votre réponse"),
    html.Button("Evaluate answer", id="submit-answer"),
    html.Button("Random question", id="random-question"),
    html.Div(id="result")
])

@app.callback(
    [dash.dependencies.Output("result", "children"),
     dash.dependencies.Output("answer-input", "value"),
     dash.dependencies.Output("question", "children"),
     dash.dependencies.Output("concept", "children")],
    [dash.dependencies.Input("submit-answer", "n_clicks"),
     dash.dependencies.Input("random-question", "n_clicks")],
    [dash.dependencies.State("answer-input", "value"),
     dash.dependencies.State("concept", "children")])
def update_question(submit_clicks, random_clicks, value, concept):
    global question
    ctx = dash.callback_context
    if not ctx.triggered:
        # Premier chargement de la page
        process = subprocess.Popen(['bash', '/home/ubuntu/LynaMOSTEFACHAA-Python-Git-Linux-Rattrapage/RandomQuestion.sh'], stdout=subprocess.PIPE)
        output = process.communicate()[0]
        question, concept = output.decode("utf-8").strip().split(",")
        return "", "", question, concept
    else:
        button_id = ctx.triggered[0]["prop_id"].split(".")[0]
        if button_id == "submit-answer":
            # Évaluation de la réponse
            if not value:
                return "", "", question, concept
            elif value.lower() in answers[concept].lower():
                process = subprocess.Popen(['bash', '/home/ubuntu/LynaMOSTEFACHAA-Python-Git-Linux-Rattrapage/RandomQuestion.sh'], stdout=subprocess.PIPE)
                output = process.communicate()[0]
                question, concept = output.decode("utf-8").strip().split(",")
                return "Réponse correcte!", "", question, concept
            else:
                return "Réponse incorrecte. Veuillez réessayer.", value, question, concept
        elif button_id == "random-question":
            # Obtenir une nouvelle question aléatoire
            question, concept = get_random_question()
            return "", "", question, concept


if __name__ == '__main__':
    app.run_server(debug=True, port=80, host='0.0.0.0')