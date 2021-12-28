#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#commit Jarek 22.12
#Poprawilem api, trzeba po innym linku sie laczyc aby seryjnie zaciagac 
import json
import pprint
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects
from requests import Request, Session
import pandas as pd
import sqlite3


def refresh_CMC_API():

    url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'

    currency = 'USD'

    parameters = {
      'convert': currency
    }
    headers = {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': '25bdeaa9-d947-4b43-83b5-f2ee7bb97197',
    }

    session = Session()
    session.headers.update(headers)
    coins_names = []
    coins_prices = []
    coins_volume_24h = []
    coins_market_cap = []
    coins_shortcut = []
    coins_id = []
    coins_mining = []
    coins_total_supply = []
    coins_max_supply = []


    try:
        response = session.get(url, params=parameters)

    except (ConnectionError, Timeout, TooManyRedirects) as e:
        print(e)

    for coins in range(100):
        coins_names.append((json.loads(response.text)['data'][coins]['name']))
        coins_prices.append((json.loads(response.text)['data'][coins]['quote'][currency]['price']))
        coins_volume_24h.append((json.loads(response.text)['data'][coins]['quote'][currency]['volume_24h']))
        coins_market_cap.append((json.loads(response.text)['data'][coins]['quote'][currency]['market_cap']))
        coins_shortcut.append((json.loads(response.text)['data'][coins]['symbol']))
        coins_total_supply.append((json.loads(response.text)['data'][coins]['total_supply']))
        coins_max_supply.append((json.loads(response.text)['data'][coins]['max_supply']))
        try:
            if (json.loads(response.text)['data'][coins]['tags'][0] == 'mineable'):
                coins_mining.append((json.loads(response.text)['data'][coins]['tags'][0]))
            else:
                coins_mining.append('not-mineable')
        except: 
            coins_mining.append('not-mineable')

    rtime = json.loads(response.text)['data'][1]["last_updated"]
    data_act = list(zip(coins_shortcut,coins_prices, coins_volume_24h, coins_market_cap))
    data_dic = list(zip(coins_shortcut, coins_names, coins_mining, coins_total_supply, coins_max_supply))
    actuals_db = pd.DataFrame(data_act, columns = ['Crypto', 'Price', 'volume 24h', 'Market Cap'])
    crypto_dict_db = pd.DataFrame(data_dic, columns = ['crypto_symbol', 'name', 'mining', 'supply', 'max_supply'])


    conn = sqlite3.connect('CryptoDB.db')

    c = conn.cursor()

   

    c.execute("Delete from ACTUAL_DATA")
    for index, row  in actuals_db.iterrows():
        c.execute("Insert into ACTUAL_DATA values(?,?,?,?)",(str(row['Crypto']),str(row['Price']),str(row['volume 24h']),str(row['Market Cap'])))

    c.execute("Delete from CRYPTO_DICT")

    for index, row  in crypto_dict_db.iterrows():
        c.execute("Insert into CRYPTO_DICT values(?,?,?,?,?)",(str(row['crypto_symbol']),str(row['name']),str(row['mining']),str(row['supply']),str(row['max_supply'])))


    conn.commit()


    conn.close()    

    return True

