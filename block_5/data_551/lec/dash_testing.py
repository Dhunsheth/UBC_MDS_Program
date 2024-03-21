import dash
from dash import html
from dash import dcc
from dash.dependencies import Input, Output
import altair as alt
from vega_datasets import data
from IPython.display import IFrame

# Read in global data
cars = data.cars()

# Setup app and layout/frontend
app = dash.Dash(__name__,  external_stylesheets=['https://codepen.io/chriddyp/pen/bWLwgP.css'])
app.layout = html.Div([
    html.Div('Hello blue dash', style={'color': 'blue', 'fontSize': 44}), 
    html.P('Hi there', id='my-para', style={'background-color':'red'}),
    html.Iframe(
        id='scatter',
        style={'border-width': '0', 'width': '100%', 'height': '400px'}),
    dcc.Dropdown(
        id='xcol-widget',
        value='Horsepower',  # REQUIRED to show the plot on the first page load
        options=[{'label': col, 'value': col} for col in cars.columns])])

# Set up callbacks/backend
@app.callback(
    Output('scatter', 'srcDoc'),
    Input('xcol-widget', 'value'))
def plot_altair(xcol):
    chart = alt.Chart(cars).mark_point().encode(
        x=xcol,
        y='Displacement',
        tooltip='Horsepower').interactive()
    return chart.to_html()

if __name__ == '__main__':
    app.run_server(debug=True)