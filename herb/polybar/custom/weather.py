#!/usr/bin/env python
import requests
import os
import sys


def get_geo():
    url = "http://ip-api.com/json"
    resp = requests.get(url)
    json = resp.json()
    return json["lat"], json["lon"]


def get_response(app_id, location=None):
    url = "https://api.openweathermap.org/data/2.5/weather"
    params = {"appid": app_id, "units": "metric"}
    if location is None:
        lat, lon = get_geo()
        params.update({"lat": lat, "lon": lon})
    else:
        params["q"] = location
    return requests.get(url, params=params)


def get_weather_string(app_id, location=None):
    resp = get_response(app_id, location)
    data = resp.json()
    temperature = int(data["main"]["temp"])
    if temperature > 0:
        temperature = f"+{temperature}"
    else:
        temperature = f"{temperature}"
    condition = data["weather"][0]["main"]
    return f"{temperature}°C, {condition}"


def get_browser_url(app_id, location=None):
    json = get_response(app_id, location).json()
    id = json["id"]
    return f"https://openweathermap.org/city/{id}"


if __name__ == "__main__":
    if (app_id := os.getenv("OPENWEATHER_APP_ID")) is None:
        print("OPENWEATHER_APP_ID is not defined")
        sys.exit(1)
    try:
        location = os.getenv("OPENWEATHER_LOCATION")
        if len(sys.argv) >= 2 and sys.argv[1] == "open":
            os.system(f"xdg-open {get_browser_url(app_id, location)}")
        else:
            print(get_weather_string(app_id, location))
    except:
        pass
