Enketo Express / Centro
=======================

## Requirements:

- VirtualBox (https://www.virtualbox.org/wiki/Downloads), tested with v4.3.18
- Vagrant (http://downloads.vagrantup.com), tested with v1.6.5

## Setup:
1. Download and install software from Requirements
2. Create a folder named 'enketo' and clone the following repositories
	a. https://github.com/twineapp/vagrant-enketo (into /enketo/vagrant)
	b. https://github.com/enketo/enketo-express (into /enketo/enketo-express)
3. Go into /enketo/enketo-express and execute the following: `git submodule update --init --recursive`
4. Edit Enketo Express config (see below).
3. Run terminal, go into enketo/vagrant and execute the following: `vagrant up`.

## Configuration:

**/enketo-express/config/config.json:**

	{"server url": "http://192.168.50.4/siv-v3/api/index.php/xmlform"}

## Restart App:

#### Automattic
	cd /var/www/enketo-express
	pm2 restart all

#### Manual
	cd ../
	cd /var/www/enketo-express
	pm2 stop enketo
	pm2 start app.js -n enketo