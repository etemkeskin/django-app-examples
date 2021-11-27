import sys
from random import randint
import dash
import dash_core_components as dcc
import dash_html_components as dhc
import pandas_datareader as pdr
from django_plotly_dash import DjangoDash

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = DjangoDash('SimpleExample3', external_stylesheets=external_stylesheets)
df = pdr.get_data_yahoo('BRK-A')
app.layout = dhc.Div(
    children=[
    dhc.H1('Stock Chart'),
          dcc.Dropdown(
               id='my-input',
               options=[
                    {'label': 'Berkshire Hathaway A', 'value': 'BRK-A'},
                    {'label': 'Berkshire Hathaway B', 'value': 'BRK-B'},
                    {'label': 'Fiat Chrysler', 'value': 'FCAU'},
                    {'label': 'Ford', 'value': 'F'},
                    {'label': 'Apple', 'value': 'AAPL'},
                    {'label': 'Amazon', 'value': 'AMZN'},
                    {'label': 'Coke', 'value': 'COKE'},
                    {'label': 'Tesla', 'value': 'TSLA'},
                    {'label': 'Google', 'value': 'GOOG'},
               ],
               value='BRK-A',
           ),
           dcc.Graph(
                id='my-graph',
                figure={
                     'data': [{
                          'name': 'Some name',
                          'mode': 'scatter',
                          'line': {
                               'color': 'rgb(0,0,255)',
                               'opacity': 1
                          },
                          'type': 'scatter',
                          'x': df.index,
                          'y': df.Open,
                     }],
                     'layout': {
                          'autosize': True,
                          'scene': {
                               'bgcolor': 'rgb(175,175,175)',
                               'xaxis': {
                                    'titlefont': {'color': 'rgb(0,0,0)'},
                                    'title': 'X-AXIS',
                                    'color': 'rgb(0,0,0)'
                               },
                               'yaxis': {
                                    'titlefont': {'color': 'rgb(0,0,0)'},
                                    'title': 'Y-AXIS',
                                    'color': 'rgb(0,0,0)'
                               }
                          }
                     }
                }
           ),
    dhc.Br(),    
    dhc.Div(id='content')
    ])

@app.callback(
        dash.dependencies.Output('my-graph', 'figure'),
        [dash.dependencies.Input('my-input', 'value')]
     )
def update_graph(value):
    df = pdr.get_data_yahoo(value)
    figure = {
            'data': [{
                'name': 'Some name',
                'mode': 'scatter',
                'line': {
                        'color': 'rgb(0,0,255)',
                        'opacity': 1
                },
                'type': 'scatter',
                'x': df.index,
                'y': df.Open,
            }],
            'layout': {
                'autosize': True,
                'scene': {
                        'bgcolor': 'rgb(0,0,0)'},
                        'xaxis': {
                            'titlefont': {'color': 'rgb(0,0,0)'},
                            'title': 'X-AXIS',
                            'color': 'rgb(0,0,0)'
                        },
                        'yaxis': {
                            'titlefont': {'color': 'rgb(0,0,0)'},
                            'title': 'Y-AXIS',
                            'color': 'rgb(0,0,0)'
                        }
                }            
        }
    return figure
