#!/bin/bash

/etc/init.d/opscenterd start
tail -f /var/log/opscenter/opscenterd.log