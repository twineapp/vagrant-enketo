#!/bin/sh

# set enketo express repo directory
ENKETO_EXPRESS_REPO_DIR="/var/www/enketo-express"

# redis setup with persistence, security, logging, multiple instances, priming 
stop redis-server
echo 'copying enketo redis conf...'
mv /etc/redis/redis.conf redis-origin.conf
cp -f $ENKETO_EXPRESS_REPO_DIR/setup/redis/conf/redis-enketo-main.conf /etc/redis/
cp -f $ENKETO_EXPRESS_REPO_DIR/setup/redis/conf/redis-enketo-cache.conf /etc/redis/
chown redis:redis /var/lib/redis/
echo 'copying enketo redis-server configs...'
mv /etc/init/redis-server.conf /etc/init/redis-server.conf.disabled
cp -f $ENKETO_EXPRESS_REPO_DIR/setup/redis/init/redis-server-enketo-main.conf /etc/init/
cp -f $ENKETO_EXPRESS_REPO_DIR/setup/redis/init/redis-server-enketo-cache.conf /etc/init/
if [ -f "/var/lib/redis/redis.rdb" ]; then
	rm /var/lib/redis/redis.rdb
fi
echo 'copying enketo default redis db...'
cp -f $ENKETO_EXPRESS_REPO_DIR/setup/redis/enketo-main.rdb /var/lib/redis/
chown redis:redis /var/lib/redis/enketo-main.rdb
chmod 660 /var/lib/redis/enketo-main.rdb
echo 'starting first enketo redis instance...'
service redis-server-enketo-main start
echo 'starting second enketo redis instance...'
service redis-server-enketo-cache start