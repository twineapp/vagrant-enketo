class lib{
	package { "libxml2-dev":
		ensure => present,
		require => Exec['apt-get update']
	}

	package { "libxslt1-dev":
		ensure => present,
		require => Exec['apt-get update']
	}
}