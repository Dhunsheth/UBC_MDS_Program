import json
import graphviz

with open('courses.json', 'r') as file:
    json_data = json.load(file)

graph = graphviz.Digraph('MyGraph')

for i in range(len(json_data)):
    graph.node(json_data[i]['course_name'], json_data[i]['course_name'])
    if json_data[i]['pre_req'] != "N/A":
        for k in json_data[i]['pre_req']:
            graph.edge(json_data[i]['course_name'], k)

graph.render('./graph_image', format='png', cleanup=True)