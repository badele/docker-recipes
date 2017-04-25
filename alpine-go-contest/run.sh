#!/bin/sh

if [ ! -e /opt/go-contest/contest.sqlite3 ]; then
    echo "Create database"
    sqlite3 /opt/go-contest/contest.sqlite3 < /opt/go-contest/create_database.sql
fi

/opt/go-contest/go-contest