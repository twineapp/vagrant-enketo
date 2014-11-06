#!/bin/sh

# config
ENKETO_EXPRESS_DIR="/var/www/enketo-express"

# enketo express
cd $ENKETO_EXPRESS_DIR
pm2 start app.js -n enketo
echo "*************************************************************************************"
echo "***                    Enketo Express should now have started!                   ****"
echo "***                                                                              ****"
echo "***   You can terminate it by ssh-ing into the VM and running: pm2 stop enketo   ****"
echo "*************************************************************************************"