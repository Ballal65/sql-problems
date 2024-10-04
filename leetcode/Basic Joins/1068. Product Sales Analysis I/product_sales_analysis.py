import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(sales, product, how="inner", on="product_id")
    return result[['product_name', 'year', 'price']]