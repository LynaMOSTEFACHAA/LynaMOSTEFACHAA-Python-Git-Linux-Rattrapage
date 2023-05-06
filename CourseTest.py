import dash
from dash import html, dcc
import random
import subprocess


answers = {
    "Git": "Un commit est une sauvegarde des modifications apportées à un fichier ou un ensemble de fichiers dans un référentiel Git.",
    "Python": "Une liste est mutable (modifiable), tandis qu'un tuple est immuable (non modifiable).",
    "Linux": "La commande pour changer les permissions d'un fichier en Linux est chmod."
}

def get_random_question():
    # Appeler le script bash et récupérer la sortie
    output = subprocess.check_output(['bash', '/home/naseem/Bureau/Projet2/RandomQuestion.sh'])

    # Convertir la sortie en chaîne de caractères et la diviser en question et concept
    question, concept = output.decode("utf-8").strip().split(",")
    return question, concept

#Initialisation
question, concept = get_random_question()

app = dash.Dash(__name__)

app.layout = html.Div([
    html.H1("Questionnaire de test de connaissances"),
    html.H2(id="concept-header", children=["Concept clé: ", html.Span(id="concept", children=concept)]),
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
        process = subprocess.Popen(['bash', '/home/naseem/Bureau/Projet2/RandomQuestion.sh'], stdout=subprocess.PIPE)
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
                process = subprocess.Popen(['bash', '/home/naseem/Bureau/Projet2/RandomQuestion.sh'], stdout=subprocess.PIPE)
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
    app.run_server(debug=True)