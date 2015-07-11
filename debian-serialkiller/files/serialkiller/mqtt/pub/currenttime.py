#!/bin/python

import mosquitto
import json
import hashlib
import time

from urllib.request import urlopen

def get_currenttime():
    result = {}
    currenttime = int(time.time())
    apiid = str(currenttime - (currenttime % 10))
    apihash = _check_md5text(apiid.encode())

    result['apihash'] = apihash
    result['currenttime'] = currenttime

    return result

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
        result = get_currenttime()
        if result['apihash'] != OLDHASH:
            OLDHASH = result['apihash']
            mqttc.publish("/labsud/city/currenttime", json.dumps(result))
        time.sleep(5)



if __name__ == "__main__":
    main()
