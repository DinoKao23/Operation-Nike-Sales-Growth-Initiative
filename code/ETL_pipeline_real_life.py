import pandas as pd
from sqlalchemy import create_engine, text
import mysql.connector
import unittest
import warnings

transaction_df = create_engine(f'mysql+mysqlconnector://xchenlmu_6060:CHENxi8952@159.65.72.135/xchenlmu_practice_database')
transaction_df = pd.read_sql('SELECT * FROM transaction', transaction_df)

class Transaction_Test(unittest.TestCase):
    def test_positive_values(self):
        # Check if all values in the 'Price' column are positive
        self.assertTrue((transaction_df['Price'] > 0).all(), "Not all prices are positive")

    def test_no_warning_raised(self):
        with self.assertWarns(None):
            if (transaction_df['Price'] > 1500).any():
                warnings.warn("Some prices exceed the threshold of 1000")

if __name__ == '__main__':
    unittest.main()