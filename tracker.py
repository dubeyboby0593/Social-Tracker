# tracker.py

import json
import requests
import phonenumbers
from phonenumbers import carrier, geocoder, timezone

def ip_track(ip):
    try:
        result = {}
        req_api = requests.get(f"http://ipwho.is/{ip}")
        ip_data = json.loads(req_api.text)

        result["ip"] = ip
        result["type"] = ip_data["type"]
        result["country"] = ip_data["country"]
        result["country_code"] = ip_data["country_code"]
        # Add more fields as needed

        return result
    except Exception as e:
        return {"error": str(e)}

def phone_track(phone):
    try:
        result = {}
        default_region = "ID"
        parsed_number = phonenumbers.parse(phone, default_region)

        # Add phone tracking logic here

        return result
    except Exception as e:
        return {"error": str(e)}

def username_track(username):
    try:
        result = {}
        social_media = [
            # Add social media tracking logic here
        ]

        for site in social_media:
            url = site['url'].format(username)
            response = requests.get(url)
            if response.status_code == 200:
                result[site['name']] = url
            else:
                result[site['name']] = f"Username not found on {site['name']}"

        return result
    except Exception as e:
        return {"error": str(e)}
