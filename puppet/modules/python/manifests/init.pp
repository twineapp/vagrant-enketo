class python{
    package { "python-software-properties":
        ensure  => present,
        require => Exec['apt-get update']
    }

    package { "python":
        ensure  => present,
        require => Exec['apt-get update']
    }
}