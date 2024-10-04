import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:

   starts = activity[activity['activity_type'] == 'start']
   starts.rename(columns={'timestamp':'start'}, inplace=True)
   starts = starts[['start','machine_id','process_id']]

   ends = activity[activity['activity_type']== 'end']
   ends.rename(columns={'timestamp':'end'}, inplace=True)
   ends = ends[['end','machine_id','process_id']]

   combined = pd.merge(starts, ends, on=['machine_id','process_id'])
   combined['diff'] = combined['end'] - combined['start']
   combined = combined[['machine_id', 'diff']]
   
   result = combined.groupby('machine_id')['diff'].mean().reset_index()
   result = result.rename(columns={'diff':'processing_time'})
   result['processing_time'] = round(result['processing_time'],3)
   return result