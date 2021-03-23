from flask import Flask
from flask import request
from flask import render_template
import requests, json, urllib
from io import BytesIO
from PIL import Image

app = Flask(__name__)

@app.route('/')
def my_form():
    return render_template('my-form.html')
#API To Call
#https://api.nasa.gov/planetary/apod?api_key=X65Ea66D2ToQk8xj282Mvz1mGdWhOuxSdWLLke1d

# Create object for the GET API request, with the api key
#TODO: Obfuscate or safely retrieve the api key and parse into the string
response = requests.get("https://api.nasa.gov/planetary/apod?api_key=X65Ea66D2ToQk8xj282Mvz1mGdWhOuxSdWLLke1d")
response_dict = json.loads(response.text)

#TODO: Display redirect URL info if code is 300 to stdout
#TODO: Send to stderr if status code is 400 or 500 to stderr
print(response.status_code)

#Output the raw body first
#TODO: send raw body as information message to stdout
print(response_dict) 

# Format output as an itemized, json key-value pair per line)
def jprint(obj):
    text = json.dumps(obj, sort_keys=True, indent=4)
    print(text)

#Full body, itemized json output
jprint(response.json())

#Get all keys as list
response_list = response_dict.keys()

#Get all values in list

#Output all list components in itemized fashion
#TODO: Dynamically pull this info from a list
for key in response_list:
    print(key)

# Output desired key-value pairs to stdout
print("Picture URL : " + response_dict['hdurl'] + "\nExplanation of URL : " + response_dict['explanation'])

#Convert the string for the image url to the actual get url, then convert to image url
image_url_string = response_dict['hdurl']
image_url = requests.get(image_url_string)
image_url_open = Image.open(BytesIO(image_url.content))

#R&D Type command for opening image. Leaving for lesson learned
# Image.open(requests.get(image_url, stream=True).raw)

#declare local file
local_picture = 'local-picture.jpg'

#Download file from url to local
urllib.request.urlretrieve(image_url_string, local_picture)

#Open file in default image viewer. Might have to allow default image viewer if not selected already
im = Image.open(local_picture)
im.show()

#TODO: Parse image into web page format

if __name__ == '__main__':
    app.run()