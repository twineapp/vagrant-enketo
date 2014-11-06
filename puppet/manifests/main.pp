Exec {
	path => [ "/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin" ]
}

exec { "apt-get update":
	command => '/usr/bin/apt-get update'
}

package { "build-essential":
    ensure  => present,
    require => Exec['apt-get update']
}

package { "g++":
    ensure  => present,
    require => Exec['apt-get update']
}

package { "make":
    ensure  => present,
    require => Exec['apt-get update']
}

package { "git":
	ensure => present,
	require => Exec['apt-get update']
}

include lib
include redis
include python
include nodejs