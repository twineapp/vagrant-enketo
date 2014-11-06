# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.define :enketo do |config|
		# basic setup
		config.vm.box = "trusty"
		config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"
		config.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", 2]
		end

		# ip address
		config.vm.network :private_network, ip: "192.168.50.2"
		# centro
		config.vm.network :forwarded_port, guest: 3000, host: 3000
		# enketo-express
		config.vm.network :forwarded_port, host: 8005, guest: 8005
	
		# synced folder
		config.vm.synced_folder "../", "/var/www", :mount_options => ["dmode=777","fmode=664"], owner: "vagrant", group: "www-data"

		# puppet
    	config.vm.provision :puppet do |puppet|
        	puppet.manifests_path = "puppet/manifests"
        	puppet.manifest_file  = "main.pp"
        	puppet.module_path = "puppet/modules"
    	end

		config.vm.provision :shell, :path => "scripts/enketo.start.sh"
	end
end