Enketo Express / Centro
=======================

## Requirements:

- VirtualBox (https://www.virtualbox.org/wiki/Downloads), tested with v4.3.18
- Vagrant (http://downloads.vagrantup.com), tested with v1.6.5

## Setup:
1. Download and install software from Requirements
2. Create a folder named 'enketo' and clone the following repositories
	a. https://github.com/twineapp/vagrant-enketo (into /enketo/vagrant)
	b. https://github.com/kobotoolbox/enketo-express (into /enketo/enketo-express)
	c. https://github.com/enketo/enketo-core (into /enketo/enketo-express/app/lib/enketo-core)
	d. https://github.com/zurb/bower-foundation (into /enketo/enketo-express/app/lib/foundation)
	e. https://github.com/enketo/bootstrap-slider (into /enketo/enketo-express/app/lib/enketo-core/lib/bootstrap-slider)
	f. https://github.com/mattbryson/TouchSwipe-Jquery-Plugin (into /enketo/enketo-express/app/lib/enketo-core/lib/jquery-touchswipe)
	g. https://github.com/enketo/jquery-xpath (into /enketo/enketo-express/app/lib/enketo-core/lib/jquery-xpath)
	h. https://github.com/requirejs/text (into /enketo/enketo-express/app/lib/enketo-core/lib/text)
	i. https://github.com/enketo/enketo-xpathjs (into /enketo/enketo-express/app/lib/enketo-core/lib/xpath)
	j. https://github.com/eternicode/bootstrap-datepicker (into /enketo/enketo-express/app/lib/enketo-core/src/widget/date/bootstrap3-datepicker)
	k. https://github.com/m3wolf/bootstrap3-timepicker (into /enketo/enketo-express/app/lib/enketo-core/src/widget/time/bootstrap3-timepicker)
	l. https://github.com/enketo/enketo-xslt (into /enketo/enketo-express/app/lib/enketo-transformer/enketo-xslt)
4. Edit Enketo Express config (see below).
3. Run terminal, go into enketo/vagrant and execute the command 'vagrant up'.

## Configuration:

**/enketo-express/config/config.json:**

	{"server url": "http://192.168.50.4/siv-v3/api/index.php/xmlform"}

## Restart App:

#### Automattic
	cd /var/www/enketo-express
	pm2 restart all

#### Manual

	cd /var/www/enketo-express
	pm2 stop enketo
	pm2 start app.js -n enketo