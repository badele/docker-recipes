#!/bin/python

import mosquitto
import json
import hashlib
import time

from urllib.request import urlopen

def get_weather():
    api = "http://api.domogeek.fr/weather/montpellier/all/today"
    response = urlopen(api).readall().decode('utf-8')

    return eval(response)

def _check_md5text(text):
    """Check integrity text"""
    m = hashlib.md5()
    m.update(text)
    return m.hexdigest()

def _check_md5file(filename):
    """Check integrity file"""
    return hashlib.md5(open(filename).read()).hexdigest()


def main():
    OLDHASH=""

    mqttc = mosquitto.Mosquitto()
    mqttc.connect("test.mosquitto.org")

    while 1 == 1:
        result = get_weather()
        myhash = (hash(frozenset(result)))
        if myhash != OLDHASH:
            OLDHASH = myhash
            mqttc.publish("/labsud/city/weather", json.dumps(result))
        time.sleep(10)


if __name__ == "__main__":
    main()
