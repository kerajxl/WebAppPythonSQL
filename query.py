#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import sqlite3

def query (query):
    conn = sqlite3.connect('CryptoDB.db')
    c = conn.cursor()
    c.execute(query)
    result = c.fetchall()
    conn.close()
    return result

