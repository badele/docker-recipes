#!/bin/sh

if [ ! -e /opt/go-contest/data/contest.sqlite3 ]; then
    echo "Create database"
    sqlite3 /opt/go-contest/data/contest.sqlite3 < /opt/go-contest/create_database.sql
fi

exec "$@"