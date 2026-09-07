import os
import requests

BASE_URL = "https://api.openweathermap.org/data/2.5/weather"
API_KEY = os.getenv("OpenWeather_API_KEY")

def get_current_weather_by_city(city, units="metric", lang="en"):
    """
    Getting weather for a specific city.

    :param city: city
    :param units: Units of measurement. eg."metric" for Celsius, "imperial" for Fahrenheit.
    :param lang: Language code for the response (e.g., "en" for English).
    :return: JSON response containing the current weather data.
    """
    if not API_KEY:
        raise ValueError("API key is not set. Please set the 'OpenWeather_API_KEY' environment variable.")

    params = {"q": city, "appid": API_KEY, "units":units, "lang": lang}
    return requests.get(BASE_URL, params=params)