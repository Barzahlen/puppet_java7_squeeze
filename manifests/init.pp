# == Class: puppet-java7-squeeze
#
# This class is able to install or remove Oracle Java 7 on Debian Squeeze.
#
# === Parameters
#
# [*ensure*]
#   String. Controls if the managed resources shall be <tt>present</tt> or
#   <tt>absent</tt>. If set to <tt>absent</tt>:
#   * The managed software packages are being uninstalled.
#   * Any traces of the packages will be purged as good as possible. This may
#     include existing configuration files. The exact behavior is provider
#     dependent. Q.v.:
#     * Puppet type reference: {package, "purgeable"}[http://j.mp/xbxmNP]
#     * {Puppet's package provider source code}[http://j.mp/wtVCaL]
#   * System modifications (if any) will be reverted as good as possible
#     (e.g. removal of created users, services, changed log settings, ...).
#   * This is thus destructive and should be used with care.
#   Defaults to <tt>present</tt>.
#
# === Examples
#
# * Installation:
#     class { 'puppet-java7-squeeze':
#       ensure => 'present'
#     }
#
# * Removal/Decommissioning:
#     class { 'puppet-java7-squeeze':
#       ensure => 'absent',
#     }
#
# === Authors
#
# * Martin Seener <mailto:martin.seener@barzahlen.de>
#
class puppet-java7-squeeze (
  $ensure = $puppet-java7-squeeze::params::ensure
) inherits puppet-java7-squeeze::params {

  ## Validate parameters

  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  ## Manage Ubuntu Precise Repository

  apt::source { "ubuntu-precise-webupd8team":
    location    => "http://ppa.launchpad.net/webupd8team/java/ubuntu",
    release     => "precise",
    repos       => "main",
    include_src => true,
    key         => "EEA14886",
    key_server  => "keyserver.ubuntu.com",
  }

  ## Setting auto-answers for oracle java 7 installer

  file { "/var/cache/debconf/java7answers.seeds":
    source => "puppet:///${module_name}/java7answers.seeds",
    ensure => present,
  }

  ## Installing Oracle Java 7

  package { "oracle-java7-installer":
    require      => File["/var/cache/debconf/java7answers.seeds"],
    responsefile => "/var/cache/debconf/java7answers.seeds",
    ensure       => $ensure,
  }

  ## Making Java 7 the default if Java 6 is already installed

  package { "oracle-java7-set-default":
    ensure       => $ensure,
    require      => Package['oracle-java7-installer'],
  }
}
