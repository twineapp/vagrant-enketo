class nodejs {
    exec { "add-apt-repo-node":
        command => 'add-apt-repository -y ppa:chris-lea/node.js ; apt-get update'
    }

    package { "nodejs":
        ensure  => present,
        require => [ Exec['apt-get update'], Exec['add-apt-repo-node'] ]
    }

    exec { "nodejs-setup":
        command => 'sudo bash /var/www/vagrant/scripts/nodejs.setup.sh',
        require => Package['nodejs']
    }
}