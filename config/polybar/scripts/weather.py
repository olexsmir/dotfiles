#!/usr/bin/env python3
# -*- encoding: utf-8 -*-
import requests
import os


API_KEY = os.getenv("OWM_POLYBAR")
CITY = os.getenv("OWM_CITY")

try:
    JSON = requests.get(f"http://api.openweathermap.org/data/2.5/weather?q={CITY}&lang=EN&&units=metric&appid={API_KEY}").json()
    print("", int(JSON["main"]["temp"]), "°С")
except:
    print(" err °С")
