# -*- coding: utf-8 -*-

# Run this app with `python app.py` and
# visit http://127.0.0.1:8050/ in your web browser.

import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.express as px
import pandas as pd

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

# assume you have a "wide-form" data frame with no index
# see https://plotly.com/python/wide-form/ for more options

df = pd.read_csv('../data/liquor_store_sales.csv')
df_bar=df[['RetailSales','RetailTransfers','WarehouseSales','ItemType']].groupby('ItemType',as_index=False).sum()

fig = px.bar(df_bar, x="ItemType", y=['RetailSales','RetailTransfers','WarehouseSales'], barmode="group")


app.layout = html.Div(children=[
    html.H1(children='Total Retail Sales, Retail Transfers, and Warehouse Sales by Item Type',style={
            'textAlign': 'center'}),

    html.Div(children='Dash: A web application framework for Python.',style={
            'textAlign': 'center'}),

    dcc.Graph(id='example-graph',figure=fig)])

if __name__ == '__main__':
    app.run_server(debug=True)