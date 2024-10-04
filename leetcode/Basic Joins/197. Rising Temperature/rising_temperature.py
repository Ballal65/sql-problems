import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    weather.sort_values('recordDate', inplace=True)
    weather.rename(columns={'recordDate' : 'currDate', 'temperature':'currTemp', 'id':'Id'}, inplace=True)
    weather['prevDate'] = weather['currDate'].shift(1) #Lag by one row
    weather['prevTemp'] = weather['currTemp'].shift(1) #Lag by one row
    weather.dropna(inplace=True)
    weather = weather[weather['currTemp'] > weather['prevTemp']]
    weather = weather[weather['currDate'] == (weather['prevDate'] + pd.Timedelta(days=1))]
    return weather[['Id']]