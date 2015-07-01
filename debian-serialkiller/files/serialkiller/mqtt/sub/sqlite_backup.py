#!/bin/python

import mosquitto
import json
import hashlib
import time
import sys
import sqlite3
import re

def toBackup(eventtime, topic, sk_id, datas):
    conn = sqlite3.connect('sqlite_backup.db')

    c = conn.cursor()

    # Insert a row of data
    ts = int(time.time())
    topic = "/labsud/labsud"
    sk_id = "99"

    c.execute("INSERT INTO mqtt_event (eventtime, topic, sk_id, content) VALUES (?, ?, ?, ?)", (
        eventtime,
        topic,
        sk_id,
        json.dumps(datas)
    )
    )

    conn.commit()
    conn.close()

# from urllib.request import urlopen
#
# def get_weather():
#     api = "http://api.domogeek.fr/weather/montpellier/all/today"
#     response = urlopen(api).readall().decode('utf-8')
#
#     return response

# def mqtt_backup(topic):
#     # apiresult = get_weather()
#     toBackup(apiresult)

def on_message(mosq, obj, msg):
    #print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))

    # Convert to string
    content = str(msg.payload)

    # Try to convert to dict(JSON)
    m = re.match(r"b'(\{.*\})", content)
    if m:
        content = json.loads(m.group(1))

    if isinstance(content, dict):
        sk_id = ""
        if 'sk_id' in content:
            sk_id = content['sk_id']

        toBackup(
            int(time.time()),
            msg.topic,
            sk_id,
            content
        )
    print("%s/%s" % (msg.topic, msg.payload))


def main():

    if len(sys.argv) < 2:
        print("Please set topic")
        sys.exit()

    topic = sys.argv[1]

    mqttc = mosquitto.Mosquitto()
    mqttc.on_message = on_message

    mqttc.connect("test.mosquitto.org")
    mqttc.subscribe(topic, 0)

    rc = 0
    while rc == 0:
        rc = mqttc.loop()
    print("rc: " + str(rc))

if __name__ == "__main__":
    main()