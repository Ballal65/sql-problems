import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    result = visits[~ visits['visit_id'].isin(transactions['visit_id'])]
    result = result[['customer_id']]
    result = result.groupby('customer_id').size().reset_index(name='count_no_trans')
    return result