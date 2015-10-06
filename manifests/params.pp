# == Class: puppet_java7_squeeze::params
#
# This class exists to declutter the default value assignment for class parameters.
# and manage internally used variables in a central place.
#
# === Parameters
#
# This class does not provide any parameters.
#
# === Examples
#
# This class is not intended to be used directly.
#
# === Links
#
# * {Puppet Docs: Using Parameterized Classes}[http://j.mp/nVpyWY]
#
# === Authors
#
# * Martin Seener <mailto:martin.seener@barzahlen.de>
#
class puppet_java7_squeeze::params {

  ## Default values for the parameters of the main module class, init.pp

  $ensure = 'present'

}
