# == Class: ubuntu-predef
#
# Full description of class ubuntu-predef here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ubuntu-predef:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class ubuntu-predef {
	include ::apt
	include ::puppet
	include ::ntp

	class { 'locales':
		default_value => 'en_US.UTF-8',
		available     => ['ru_RU.UTF-8 UTF-8'],
	}

	class {'timezone':
		zone => 'Asia/Yekaterinburg'
	}

	$packages = [
		'htop'
	]

	package { $packages:
		ensure  => installed,
		require => Class['Apt::Update']
	}
}
