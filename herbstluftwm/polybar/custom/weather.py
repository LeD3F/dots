#!/usr/bin/env python
import requests
import os
import sys


def get_geo():
    url = "http://ip-api.com/json"
    resp = requests.get(url)
    json = resp.json()
    return json["lat"], json["lon"]


def get_weather_string(app_id, location=None):
    url = "https://api.openweathermap.org/data/2.5/weather"
    params = {"q": "Znamianka", "appid": app_id, "units": "metric"}
    if location is None:
        lat, lon = get_geo()
        params.update({"lat": lat, "lon": lon})
    else:
        params["q"] = location
    resp = requests.get(url, params=params)
    data = resp.json()
    temperature = int(data["main"]["temp"])
    if temperature > 0:
        temperature = f"+{temperature}"
    else:
        temperature = f"{temperature}"
    condition = data["weather"][0]["main"]
    location_icon = "\uf450 " if location is None else ""
    return f"{location_icon}{temperature}°C, {condition}"


if __name__ == "__main__":
    if (app_id := os.getenv("OPENWEATHER_APP_ID")) is None:
        print("$OPENWEATHER_APP_ID is not defined")
        sys.exit(1)
    try:
        location = os.getenv("OPENWEATHER_LOCATION")
        print(get_weather_string(app_id, location))
    except:
        pass
