class redis{
    exec { "add-apt-repo-redis":
        command => 'add-apt-repository -y ppa:rwky/redis; apt-get update'
    }

    package { "redis-server":
        ensure  => present,
        require => [ Exec['apt-get update'], Exec['add-apt-repo-redis'] ]
    }

    exec { "redis-setup":
        command => 'sudo bash /var/www/vagrant/scripts/redis.setup.sh',
        require => Package['redis-server']
    }
}