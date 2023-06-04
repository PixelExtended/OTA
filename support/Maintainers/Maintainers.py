import os, json, tables
import pandas as pd

path_to_json = 'builds/'
json_files = [pos_json for pos_json in os.listdir(path_to_json) if pos_json.endswith('.json')]
#print(json_files)  # for me this prints ['foo.json']

# here I define my pandas Dataframe with the columns I want to get from the json
jsons_data = pd.DataFrame(columns=[ 'Maintainer', 'Device', 'Codename', 'Last Pex Version', 'Device Status'])

# we need both the json and an index number so use enumerate()
for index, js in enumerate(json_files):
    with open(os.path.join(path_to_json, js)) as json_file:
        json_text = [json.load(json_file)]

        # here you need to know the layout of your json and each json has to have
        # the same structure (obviously not the structure I have here)
        tg_username = json_text[0]['tg_username']
        device_name = json_text[0]['device_name']
        codename = json_text[0]['device']
        pexv = json_text[0]['pexv']
        status = json_text[0]['status']
        # here I push a list of data into a pandas DataFrame at row given by 'index'
        jsons_data.loc[index] = [tg_username, device_name, codename, pexv, status]

# now that we have the pertinent json data in our DataFrame let's look at it
print(jsons_data)
#jsons_data.to_csv (r'/home/heisinbug/OTA/support/maintainer.csv', index = True)
jsons_data.to_markdown (r'support/Maintainers/Maintainer.md', index = True)
