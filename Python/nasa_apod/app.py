from flask import Flask
from flask import request
from flask import render_template
import requests, json, urllib

app = Flask(__name__)

@app.route('/')
def index(): 
    return render_template('index.html')

@app.route('/nasa_flask_app.html')
def nasa_flask_app():
    #url = 'https://jankeemunkey.com/jank_final.jpg'
    #print("POTD: " + url)
    
    #Define api and api token string
    response = requests.get("https://api.nasa.gov/planetary/apod?api_key=X65Ea66D2ToQk8xj282Mvz1mGdWhOuxSdWLLke1d")
    response_dict = json.loads(response.text)

    #Enumerate key names
    date = response_dict['date']
    explanation = response_dict['explanation']
    image_url = response_dict['url']
    title = response_dict['title']

    return render_template('nasa_flask_app.html', date=date, explanation=explanation, image_url=image_url, title=title)

if __name__ == '__main__':
    app.run()