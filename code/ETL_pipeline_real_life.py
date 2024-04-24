import pandas as pd
from sqlalchemy import create_engine, text
import mysql.connector
import unittest
import warnings

con = create_engine(f'mysql+mysqlconnector://xchenlmu_6060:CHENxi8952@159.65.72.135/xchenlmu_practice_database')
transaction_df = pd.read_sql_query('SELECT * FROM Fact_Transaction', con)

class Transaction_Test(unittest.TestCase):
    def test_positive_values(self):
        # Check if all values in the 'Price' column are positive
        self.assertTrue((transaction_df['retail_price'] > 0).all(), "Not all prices are positive")

    def test_no_warning_raised(self):
        self.assertTrue((transaction_df['retail_price'] > 0).all(), "Some purchase exceed the threshold of 100 items")

transaction_df.to_csv('fact_transaction.csv', index=False)

my_db = create_engine(f"mysql+mysqlconnector://bsan6060:awsBSAN6060@tlkbsanaws.czqk6eiqwr12.us-east-2.rds.amazonaws.com/assignment_2")

transaction_df.to_sql('fact_transaction', my_db, if_exists='replace', index=False)


if __name__ == '__main__':
    unittest.main()