#!/usr/bin/env python3
# -*- encoding: utf-8 -*-
import requests, os

API_KEY = os.getenv("OWM_POLYBAR")
CITY = "Horodnytsya,UA"

try:
    JSON = requests.get(f"http://api.openweathermap.org/data/2.5/weather?q={CITY}&lang=EN&&units=metric&appid={API_KEY}").json()
except Exception as e:
    print("No connection")

try:
    if JSON['weather'][0]['main'] == "Clear": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Thunderstorm": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Drizzle": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Rain": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Snow": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Mist": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Smoke": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Haze": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Dust": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Fog": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Sand": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Ash": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Squall": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Tornado": print("", int(JSON["main"]["temp"]),"°С")
    elif JSON['weather'][0]['main'] == "Clouds": print("", int(JSON["main"]["temp"]),"°С")
except Exception as e:
    print(int(JSON["main"]["temp"]),"°С")
