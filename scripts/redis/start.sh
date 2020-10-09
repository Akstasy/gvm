#!/bin/bash

sleep 5
rm -rf /run/redis/redis.sock
redis-server /etc/redis.conf
