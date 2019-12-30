import os, glob, json
path = os.path.dirname(os.path.realpath(__file__))
dsPath = path + '/datasources'
#Read influx datasource
with open(dsPath + '/influxdb.yaml', 'r') as file:
  data = file.read()
file.close()

#Read all json files in datasources folder
for filename in glob.glob(dsPath + '/*.json'):
  with open(filename, 'r') as file:
    o = json.load(file)
    data += '\n- name: ' + o['name']
    data += '\n  type: ' + o['type']
    data += '\n  url: ' + o['url']
    data += '\n  database: ' + o['database']
    data += '\n  user: ' + o['user']
    data += '\n  secureJsonData:'
    data += '\n    password: ' + o['password']
    data += '\n  editable: false'
  file.close()    

#Open yaml to write data in
yaml = open(path + '/influxdb-datasource.yaml', 'w+')
yaml.write(data)
yaml.close()

 
