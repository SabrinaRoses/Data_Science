# Import required packages
import pandas as pd 
import dash
from dash import dcc
from dash import html
import plotly.express as px
from dash.dependencies import Input, Output
import dash_core_components as dcc

# Add DatraFrame
df = pd.DataFrame({
    "Fruit": ["Apples", "Oranges", "Bananas", "Apples", "Oranges", "Bananas"],
    "Amount": [4, 1, 2, 2, 4, 5],
    "City": ["SF", "SF", "SF", "NYC", "MTL", "NYC"]
})

# Add a bar graph figure

fig = px.bar(df, x="Fruit", y="Amount", color="City", barmode="group")


app = dash.Dash()
app.layout = html.Div(children=[
    html.H1(
        children='Dashboard',
        style={
            'textAlign': 'center'
        }
    ),

    #create a dropdown,
    dcc.Dropdown(options=[
        {'label': 'New York City', 'value': 'NYC'},
        {'label': u'Montréal', 'value': 'MTL'},
        {'label': 'San Francisco', 'value': 'SF'}
    ],
        value='NYC' #providing a vallue to dropdown

    ),

    #bar graph
    dcc.Graph(id="example-graph-2", figure=fig)
])

# Run application

if __name__ == "__main__":
    app.run_server()