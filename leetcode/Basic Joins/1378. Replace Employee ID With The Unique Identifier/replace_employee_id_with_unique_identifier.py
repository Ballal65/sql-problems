import pandas as pd

def replace_employee_id(employees: pd.DataFrame, employee_uni: pd.DataFrame) -> pd.DataFrame:
    merged_tables = pd.merge(employees, employee_uni, how='left',on='id')
    return merged_tables[['unique_id','name']]