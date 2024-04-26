import pandas as pd
import random
from sqlalchemy import create_engine, text
import mysql.connector

random.seed(27)


nike_prod = pd.read_csv("Nike_UK_2022-09-01.csv")
nike_prod.drop_duplicates(subset=['PRODUCT_NAME', 'PRODUCT_ID','IS_BESTSELLER'], inplace=  True)

transaction = pd.read_csv("transaction_data.csv", parse_dates=['TransactionTime'])

df = pd.read_csv("transaction_data.csv", parse_dates=['TransactionTime'])

# There are some date that is in 2028, we need to remove around 5000 rows
df['TransactionTime'] = pd.to_datetime(df['TransactionTime'], errors='coerce')
df = df[df['TransactionTime'] < '2024-04-15']

# Replace the ItemCode with the PRODUCT_ID
tst = nike_prod['PRODUCT_ID'].unique()
random_value= random.choices(tst, k = len(df))

df['ItemCode']= random_value

# Repalce the NumberOfItemsPurchased with random value to increase randomness
df["NumberOfItemsPurchased"] = df.apply(lambda row: random.randint(1, 12), axis=1)

# Seperate users and none users
not_one = df.query('UserId != -1')
one = df.query('UserId == -1')

# Replace with random user id
not_one.loc[:,'UserId'] = df.apply(lambda row: random.randint(100000, 199999), axis=1)

# merge the two dataframes togehter
result = pd.concat([not_one,one])

# Remove the columns that are not needed
result.drop(['CURRENCY','TID', 'PRODUCT_URL', 'CostPerItem', 'PRODUCT_SIZE','InsertUpdateTime', 'RunDate', 'PRICE_CURRENT'], axis = 1, inplace= True)

# Make a calculation field for the total revenue
result['revenue'] = result['PRICE_RETAIL'] * result['NumberOfItemsPurchased']

mysql_db = create_engine(f'mysql+mysqlconnector://xchenlmu_6060:CHENxi8952@159.65.72.135/xchenlmu_practice_database')
result.to_sql("Trans_Prod", con = mysql_db, if_exists = 'replace', index= False, chunksize = 50000)