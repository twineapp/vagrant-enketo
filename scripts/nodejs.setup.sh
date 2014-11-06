#!/bin/sh

# config
ENKETO_EXPRESS_DIR="/var/www/enketo-express"

# install grunt-cli, nodemon, mocha, bower and pm2 globally
npm install -g grunt-cli nodemon mocha bower pm2 --unsafe-perm

# enketo express setup
cd $ENKETO_EXPRESS_DIR

# remove node_modules if exists because npm builds can be system-specific
if [ -d "$ENKETO_EXPRESS_DIR/node_modules" ]; then
	rm -R $ENKETO_EXPRESS_DIR/node_modules
fi

# npm and bower install
npm install --unsafe-perm
bower install --allow-root

# grunt (build js and css)
grunt symlink
grunt compile