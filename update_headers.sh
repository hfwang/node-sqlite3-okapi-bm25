#!/bin/sh

# This is a really really lame way of grabbing sqliteext.h
npm install --build-from-source sqlite3
cp ./node_modules/sqlite3/build/Release/obj/gen/sqlite-autoconf-*/sqlite3ext.h deps/sqlite3ext.h
cp ./node_modules/sqlite3/build/Release/obj/gen/sqlite-autoconf-*/sqlite3.h deps/sqlite3.h
rm -rf ./node_modules/sqlite3/
