#!/bin/bash

TYPE=$1 #GROUP or INSTANCE
NAME=$2 #name of group or instance
STATE=$3 #MASTER, BACKUP FAULT

case $STATE in
        "MASTER") echo $(date)': '$STATE >> /data/running/redis-6389/keep_alived_state #Become redis master
                  python /data/running/redis-6389/change_redis.py master
                  exit 0
                  ;;
        "BACKUP") echo $(date)': '$STATE >> /data/running/redis-6389/keep_alived_state #Become redis slave
                  python /data/running/redis-6389/change_redis.py slave
                  exit 0
                  ;;
        "FAULT")  echo $(date)': '$STATE >> /data/running/redis-6389/keep_alived_state #restart and become redis slave
                  exit 0
                  ;;
        *)        echo "unknown state"
                  exit 1
                  ;;
esac
