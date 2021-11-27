import dash_table
from django_plotly_dash import DjangoDash
#New
import pathlib
import pandas as pd
import json
import pathlib
import math
from urllib.request import urlopen
import json
import re
import dash
from dash.dependencies import Input, Output, State, ClientsideFunction
import plotly_express as px
import dash_html_components as html
import dash_core_components as dcc
import plotly.graph_objs as go
import pandas as pd
from datetime import datetime, timedelta, date
import datetime as dt
import numpy as np
import dash_daq as daq
from dateutil import relativedelta

# get relative data folder
PATH = pathlib.Path(__file__).parent #get current folder
DATA_PATH = PATH.joinpath("data").resolve() #append \data

app = DjangoDash('SimpleExample5')

########################################
########## Data Preprocessing ##########
# Read data
retailer_df = pd.read_csv(DATA_PATH.joinpath("sale_data.csv"),encoding="utf-8")

usa_states = json.load(open(DATA_PATH.joinpath("usa_geoson_states.json"), 'r', encoding="utf8")) # harita verisi

# Date
# Format order date
retailer_df["Order_Date"] = retailer_df["Order_Date"].apply(
    lambda x: datetime.strptime(x, "%d/%m/%Y")
)  # String -> Datetime

# Date
# Format siparis zamanı
retailer_df["Shipment_Date"] = retailer_df["Shipment_Date"].apply(
    lambda x: datetime.strptime(x, "%d/%m/%Y")
)

# Insert weekday, month, and year of order date
retailer_df["Days_of_Wk"] = retailer_df["Order_Month"] = retailer_df["Order_Year"] = retailer_df["Order_Date"]

retailer_df["Days_of_Wk"] = retailer_df["Days_of_Wk"].apply(
    lambda x: datetime.strftime(x, "%A")
)  # Datetime -> weekday string

retailer_df["Order_Month"] = retailer_df["Order_Month"].apply(
    lambda x: datetime.strftime(x, "%m")
)  # Datetime -> month

retailer_df["Order_Year"] = retailer_df["Order_Year"].apply(
    lambda x: datetime.strftime(x, "%Y")
)  # Datetime -> month

day_list = ["Sunday", "Saturday", "Friday", "Thursday", "Wednesday", "Tuesday", "Monday", ]

category_list = retailer_df["Category"].unique().tolist()
segment_list = retailer_df["Segment"].unique().tolist()
########## Data Preprocessing ##########
########################################

app.layout = html.Div(children=[
    html.H1(children='Sales Analysis'),

    html.Div(children=[
        html.Div(
                [
                    html.P(children = "Filter by order date (or select range in histogram) :", style={"font-weight": "bold",}),
                    dcc.RangeSlider(id="time-window-slider"),
                    html.Br(),
                    html.P("Choose presentation type:", className="control_label", style = {"font-weight":"bold"}),
                    dcc.RadioItems(
                        id="display_status_selector",
                        options=[
                            {"label": "Order Quantity", "value": "siparis"},
                            {"label": "Sales", "value": "satis"},
                            {"label": "Profit", "value": "kar"},
                        ],
                        value="satis",
                        labelStyle={"display": "inline-block"},
                        className="dcc_control",
                    ),
                    html.Br(),
                    html.P(children = "Filter by segment :", style = {"font-weight":"bold"}),
                    dcc.Dropdown(
                            id="segment-select",
                            options=[{"label": i, "value": i} for i in segment_list],
                            value=segment_list,
                            multi=True,
                    ),
                    html.Br(),
                    html.P(children = "Filter by category :", style = {"font-weight":"bold"}),
                    dcc.Dropdown(
                            id="category-select",
                            options=[{"label": i, "value": i} for i in category_list],
                            value=category_list,
                            multi=True,
                    ),
                    html.Br(),
                ], style={'width':'400px','background-color':'white', 'padding':'10px','margin-bottom':'5px'} # 1.COLUMN 
            ),
       

        html.Div(children=[


            html.Div(
                        [
                            html.Div(
                                [html.H3(id="siparisText"), html.P("Order Quantity")],
                                id="siparis",
                                style={'padding':'10px','width':'250px', 'background-color':'white', 'margin-left':'10px'},
                            ),
                            html.Div(
                                [html.H3(id="satisText"), html.P("Sales")],
                                id="satis",
                                style={'padding':'10px','width':'250px', 'background-color':'white', 'margin-left':'10px'},
                            ),
                            html.Div(
                                [html.H3(id="karText"), html.P("Profit")],
                                id="kar",
                                style={'padding':'10px','width':'250px', 'background-color':'white', 'margin-left':'10px'},
                            ),
                        ],
                        id="info-container",
                        style={'display':'flex', 'flex-wrap': 'wrap','font-size':'1.2rem'},
                    )


            
        ], style={'color':'#212529'}), # 2.COLUMN ===


            



    ], style={'display':'flex', 'flex-wrap': 'wrap'}),



            html.Div(
                [
                    html.Div(
                        [dcc.Graph(id="bolge-pie")],
                        style={'width':'700px', 'margin':'15px'},
                    ),
                    html.Div(
                        [dcc.Graph(id="category-pie")],
                        style={'width':'700px', 'margin':'15px'},
                    ),
                ],
                style={'display':'flex', 'flex-wrap': 'wrap'},
            ),

# HEAT MAP GRAPH 
        html.Div(
                [
                    html.Div(
                        id="heatmap_card",
                        children=[
                            dcc.Graph(id="heatmap"), #patient_volume_hm
                            ],
                        className="container shadow col-md-12",
                        ),
                ],
                style={'margin':'20px'}
            ),

#CHOROPLETH MAP
            html.Div(
                [dcc.Graph(id="tr_choropleth")],
                className="row shadow pretty_container",
            ),
])

######################################
############  callbacks  #############
@app.callback(
        Output("tr_choropleth", "figure"),
        [
            Input("time-window-slider", "value"),
            Input("display_status_selector", "value"),
            Input("segment-select", "value"),
            Input("category-select", "value"),
        ],
    )
def generate_choropleth(time_values, selector, segment, kategori):
    if time_values is not None:
        min_date, max_date = time_slider_to_date(time_values)

        filtered_df = retailer_df.sort_values("Order_Date").set_index("Order_Date")[min_date:max_date]

        filtered_df = filtered_df[filtered_df["Segment"].isin(segment)& filtered_df["Category"].isin(kategori)]

        df = pd.DataFrame(filtered_df.groupby(["State"]).sum().reset_index())
        # print(df.head(10))
        # hovertemplate = "<br> %{z} TL"
        
        if selector == "siparis":
            z_val = "Quantity"
        elif selector == "satis":
            z_val = "Sales"
        else:
            z_val = "Profit"

        fig = go.Figure(go.Choroplethmapbox(geojson=usa_states, locations=df.State, z=df[z_val],
                                    colorscale=[[0, "#65aaf7"], [1, "#012d6b"]],
                                    colorbar = dict(thickness=20, ticklen=3), featureidkey="properties.NAME",
                                    #hovertemplate = hovertemplate,
                                    #hoverinfo=z,
                                    zmin=df[z_val].min(), zmax=df[z_val].max(),
                                    below=True,
                                    marker_opacity=0.6, marker_line_width=0.2))

        fig.update_layout(mapbox_style="carto-positron", mapbox_zoom=3, mapbox_center = {"lat": 38.54, "lon": -92.53}, height=500,)
        fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

        return fig
    return {"data":[]}


@app.callback(
        [   Output("time-window-slider", "marks"), 
            Output("time-window-slider", "min"),
            Output("time-window-slider", "max"),
            Output("time-window-slider", "step"),
            Output("time-window-slider", "value"),],
        [Input("time-window-slider", "src")],)
def populate_time_slider(src):
    """
    Depending on our dataset, we need to populate the time-slider
    with different ranges. This function does that and returns the
    needed data to the time-window-slider.
    """
    min_date = retailer_df["Order_Date"].min()
    max_date = retailer_df["Order_Date"].max()

    marks = make_marks_time_slider(min_date, max_date)
    min_epoch = list(marks.keys())[0]
    max_epoch = list(marks.keys())[-1]
    return (
        marks,
        min_epoch,
        max_epoch,
        (max_epoch - min_epoch) / (len(list(marks.keys())) * 3),
        [min_epoch, max_epoch],)

@app.callback(
        [
            Output("siparisText", "children"),
            Output("satisText", "children"),
            Output("karText", "children"),
        ],
        [
            Input("time-window-slider", "value"),
            Input("segment-select", "value"),
            Input("category-select", "value"),
        ],)
def update_siparis_text(time_values, segment, kategori):
    if time_values is not None:
        min_date, max_date = time_slider_to_date(time_values)

        filtered_df = retailer_df.sort_values("Order_Date").set_index("Order_Date")[min_date:max_date]
        filtered_df = filtered_df[filtered_df["Segment"].isin(segment) & filtered_df["Category"].isin(kategori)]
        
        order_quantity = f'{filtered_df.Quantity.sum():.0f}'
        order_quantity = comma_me(order_quantity)
        
        sales=f'{filtered_df.Sales.sum():.0f}'
        sales = comma_me(sales)
        
        profit=f'{filtered_df.Profit.sum():.0f}'
        profit = comma_me(profit)
        
        result = order_quantity + " item", sales + " $", profit + " $"
    else:
        result = "no result", "no result", "no result"
    return result

@app.callback(
    Output("category-pie", "figure"),
    [
        Input("time-window-slider", "value"),
        Input("display_status_selector", "value" ),
        Input("segment-select", "value"),
        Input("category-select", "value"),
    ],)
def update_category_pie(time_values, selector, segment, category):
    graph_type = "Category"
    
    if time_values is not None:
        min_date, max_date = time_slider_to_date(time_values)
        return generate_pie_graph(min_date, max_date, graph_type, selector, segment, category)
    return {"data":[]}

@app.callback(
        Output("bolge-pie", "figure"),
        [   Input("time-window-slider", "value"),
            Input("display_status_selector", "value"),
            Input("segment-select", "value"), 
            Input("category-select", "value"),],)
def update_bolge_pie(time_values, selector, segment, category):    
    graph_type = "Region"
    if time_values is not None:
        min_date, max_date = time_slider_to_date(time_values)
        return generate_pie_graph(min_date, max_date, graph_type, selector, segment, category)
    return {"data":[]}

@app.callback(
        Output("heatmap", "figure"),
        [
            Input("time-window-slider", "value"),
            Input("display_status_selector", "value"),
            Input("segment-select", "value"),
            Input("category-select", "value"),
        ],
    )
def update_heatmap(time_values, selector, segment, category):
    #print("\t time values first heatmap : type ", type(time_values))
    if time_values is not None:
    # Return to original hm(no colored annotation) by resetting
        min_date, max_date = time_slider_to_date(time_values)
        return generate_heatmap(min_date, max_date, selector, segment, category)

    return {"data":[]}
######################################
############  callbacks  end #############
######################################
############  functions  #############
def make_marks_time_slider(mini, maxi):
    """
    A helper function to generate a dictionary that should look something like:
    {1420066800: '2015', 1427839200: 'Q2', 1435701600: 'Q3', 1443650400: 'Q4',
    1451602800: '2016', 1459461600: 'Q2', 1467324000: 'Q3', 1475272800: 'Q4',}
    """
    step = relativedelta.relativedelta(months=+1)
    start = datetime(year=mini.year, month=1, day=1) 
    end = datetime(year=maxi.year, month=maxi.month, day=30)
    ret = {}

    current = start
    while current <= end:
        current_str = int(current.timestamp())
        if current.month == 1:
            ret[current_str] = {
                "label": str(current.year),
                "style": {"font-weight": "bold"},
            }
        elif current.month == 4:
            ret[current_str] = {
                "label": "Q1",
                "style": {"font-weight": "lighter", "font-size": 7},
            }
        elif current.month == 7:
            ret[current_str] = {
                "label": "Q2",
                "style": {"font-weight": "lighter", "font-size": 7},
            }
        elif current.month == 10:
            ret[current_str] = {
                "label": "Q3",
                "style": {"font-weight": "lighter", "font-size": 7},
            }
        else:
            pass
        current += step
    return ret

def generate_pie_graph(start_date, end_date, column, selector, segment, category):    
    filtered_df = retailer_df.sort_values("Order_Date").set_index("Order_Date")[start_date:end_date]
    
    filtered_df = filtered_df[filtered_df["Segment"].isin(segment) & filtered_df["Category"].isin(category)]

    nb_cases = len(filtered_df.index)
    types = []
    values = []
    title1 = ""
    title2 = ""
    
    if column == "Region":
        title1 = " by Region"
    else:
        title1= " by Categories"
    
    types = filtered_df[column].unique().tolist()

    # if no results were found
    if types == []:
        layout = dict(
            autosize=True,
            annotations=[dict(text="No results found", showarrow=False)]
        )
        return {"data": [], "layout": layout}

    if selector == "siparis":
        title2 = "Order Quantity"
        for type in types:
            nb_type = filtered_df.loc[filtered_df[column] == type].shape[0]
            values.append(nb_type / nb_cases * 100)
    elif selector == "satis":
        title2 = "Sales"
        total_satis = filtered_df["Sales"].sum()
        for type in types:
            type_satis = filtered_df.loc[filtered_df[column] == type]["Sales"].sum()
            values.append(type_satis/total_satis*100)
    else:
        title2 = "Profit"
        total_kar = filtered_df["Profit"].sum()
        for type in types:
            type_kar = filtered_df.loc[filtered_df[column] == type]["Profit"].sum()
            values.append(type_kar/total_kar*100)
    

    crit = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

    color_dict = {'1':'#e6f2ff','2':'#99ccff','3':'#ccccff','4':'#cc99ff','5':'#ff99ff','6':'#ff6699','7':'#ff9966','8':'#ff6600','9':'#ff5050','10':'#ff0000'}

    colors = np.array([''] * len(crit), dtype = object)

    for i in np.unique(crit):
        colors[np.where(crit == i)] = color_dict[str(i)]

    layout = go.Layout(
        title=  title2 + " Rates" + title1,
        autosize=True,
        margin=dict(l=10, r=10, b=40, t=40, pad=8),
        paper_bgcolor="white",
        plot_bgcolor="white",
        height=400,
    )

    trace = go.Pie(
        labels=types,
        values=values,
        marker={"colors": colors},
        hoverinfo="value", #text+value+percent
        textinfo="label+percent",  #label+percent+name
        hole=0.1,  
    )

    return {"data": [trace], "layout": layout}

def generate_heatmap(start_date, end_date, selector, segment, kategori):
    """
    :param: start: start date from selection.
    :param: end: end date from selection.
    """
    filtered_df = retailer_df.sort_values("Order_Date").set_index("Order_Date")[ start_date:end_date]

    filtered_df = filtered_df[filtered_df["Segment"].isin(segment)& filtered_df["Category"].isin(kategori)]
    
    x_axis = []
    for i in range(1,13):
        x_axis.append((dt.date(2018, i, 1).strftime('%m')))

    y_axis = day_list

    month = ""
    weekday = ""

    if selector == "siparis":
        hovertemplate = "<b> %{y}  %{x} <br><br> %{z} item "
        record = "Quantity"
        title="Order Quantity"
    elif selector == "satis":
        hovertemplate = "<b> %{y}  %{x} <br><br> %{z} TL Sales"
        record = "Sales"
        title="Sales"
    else:
        hovertemplate = "<b> %{y}  %{x} <br><br> %{z} TL Profit"
        record = "Profit"
        title="Profit"
        
    # Get z value : sum(number of records) based on x, y,

    z = np.zeros((7, 12))
    annotations = []

    for ind_y, day in enumerate(y_axis):
        filtered_day = filtered_df[filtered_df["Days_of_Wk"] == day]

        for ind_x, x_val in enumerate(x_axis):
            sum_of_record = filtered_day[filtered_day["Order_Month"] == x_val][record].sum()
            sum_of_record = f'{sum_of_record:.0f}'
            z[ind_y][ind_x] = sum_of_record

            annotation_dict = dict(
                showarrow=False,
                text="<b>" + str(sum_of_record) + "<b>",
                xref="x",
                yref="y",
                x=x_val,
                y=day,
                font=dict(family="sans-serif"),
            )
            annotations.append(annotation_dict)


    data = [
        dict(
            x=x_axis,
            y=y_axis,
            z=z,
            type="heatmap",
            name="",
            hovertemplate=hovertemplate,
            showscale=True,
            colorscale=[[0, "#caf3ff"], [1, "#2c82ff"]],)
    ]

    layout = dict(
        title=f"{title} on Day-Month basis",
        margin=dict(l=70, b=20, t=50, r=50),
        modebar={"orientation": "v"},
        font=dict(family="sans-serif"),
        annotations=annotations,
        xaxis=dict(
            side="top",
            ticks="",
            ticklen=2,
            tickfont=dict(family="sans-serif"),
            tickcolor="#ffffff",
        ),
        yaxis=dict(
            side="left",
            ticks="",
            tickfont=dict(family="sans-serif"),
            ticksuffix=" "
        ),
        hovermode="closest",
        showlegend=False,
    )
    return {"data": data, "layout": layout}

def comma_me(amount):
    orig = amount
    new = re.sub("^(-?\d+)(\d{3})", '\g<1>,\g<2>', amount)
    if orig == new:
        return new
    else:
        return comma_me(new)

def time_slider_to_date(time_values):
    """ TODO """
    min_date = datetime.fromtimestamp(time_values[0]).strftime("%c")
    max_date = datetime.fromtimestamp(time_values[1]).strftime("%c")
    return [min_date, max_date]