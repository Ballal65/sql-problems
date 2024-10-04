import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
   result = views[views['viewer_id'] == views['author_id']]
   result = result.drop_duplicates()
   result = result.rename(columns = {'author_id' : 'id'}).sort_values('id', ascending=True)
   return result[['id']]