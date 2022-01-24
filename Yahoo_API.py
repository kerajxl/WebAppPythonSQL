#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas_datareader as pdr
from datetime import date
import datetime as dt
import json 
import requests
from query import query
import pandas as pd
import sqlite3

def yahoo_refresh():
    currency = 'USD'
    today = date.today().strftime("%Y,%m,%d")
    parts = today.split(",")
    year_e, month_e, day_e = int(parts[0]), int(parts[1]), int(parts[2])
    x = 0
    coins_shortcut = []
    coins = query('Select distinct crypto_symbol from actual_data')
    for coin in coins:
        coins_shortcut.append(coin[0])

    historical_lst_tpl = query('select distinct crypto_symbol, strftime("%Y-%m-%d", date), high, low, close, volume  from historical_data where crypto_symbol != "nan" ')
    historical_df = pd.DataFrame(historical_lst_tpl, columns=['crypto_symbol', 'Date', 'high', 'low','close', 'volume'])

    x=0
    historical = []
    existing = []

    for symbol in historical_df.crypto_symbol.unique():

        historical.append(historical_df[historical_df.crypto_symbol == symbol])
        y = historical[x].sort_values( by = 'Date', ascending = True).tail(1)
        y_date = pd.to_datetime(y['Date'])
        year_s, month_s, day_s  = (y_date).dt.year.values[0], (y_date).dt.month.values[0], (y_date).dt.day.values[0]
        start = dt.datetime(year_s,month_s,day_s+1)
        end = dt.datetime(year_e,month_e,day_e)
        df = existing
        if (month_s!=month_e or day_s!=day_e):
            try:
                tag = symbol + '-' + currency
                df.append(pdr.get_data_yahoo(tag, start , end ))
                df[x]['Crypto'] = symbol
                df[x].reset_index(inplace = True, drop = False)

            except:

                try:
                    tag = symbol + '1-' + currency
                    df.append(pdr.get_data_yahoo(tag, start , end ))
                    df[x]['Crypto'] = symbol
                    df[x].reset_index(inplace = True, drop = False)
                except:

                    try:
                        tag = symbol + '3-' + currency
                        df.append(pdr.get_data_yahoo(tag, start , end ))
                        df[x]['Crypto'] = symbol
                        df[x].reset_index(inplace = True, drop = False)
                    except:
                        pass


            x += 1
        else:
            pass

    try:
        existing_df = pd.concat(existing)

        existing_df.reset_index(inplace = True, drop = True)  
        exs_df = existing_df
        conn = sqlite3.connect('CryptoDB.db')
        for rows in exs_df.index:
            c = conn.cursor()
            c.execute("Insert into historical_data values(?,?,?,?,?,?)",((exs_df['Crypto'][rows]),str(exs_df['Date'][rows]),
                                                                  (exs_df['High'][rows]),(exs_df['Low'][rows]),
                                                                  (exs_df['Close'][rows]),str(exs_df['Volume'][rows])))
            conn.commit()
        conn.close() 
    except:
        pass

    return True
    

