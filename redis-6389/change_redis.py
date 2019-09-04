#!/usr/bin/python

import redis
import re
import sys

#main
status=sys.argv[1]
r = redis.StrictRedis(host='localhost', port=6389, db=0)
print r.info().get("role")
if status == 'master':
        r.slaveof()
        r.config_set("save", "")
print r.info().get("role")
