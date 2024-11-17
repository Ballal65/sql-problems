import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    joined_tables = pd.merge(employee, bonus, how="left", on="empId")
    bonus_filter =  joined_tables[(joined_tables['bonus'] < 1000) | (joined_tables['bonus'].isna())]
    return bonus_filter[['name','bonus']]