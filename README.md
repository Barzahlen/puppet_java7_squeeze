# puppet_java7_squeeze

A puppet 2.7.x compatible module which manages Oracle Java 7 on Debian Squeeze using the Ubuntu Precise repository

## Purpose

While we wanted to be able to use the latest Logstash/Elasticsearch Stack, we had to upgrade Java to at least Java 7 (dispite Java 8 is recommended)
in order to use the newest versions. This puppet module just installs/removes the latest Oracle Java 7 for Debian Squeeze using
the Debian packages from the Ubuntu Precise repository. Using those packages is not officially supported but works quite well for us.

## Requirements

It has been tested with Puppet 2.7.19+ and requires the "apt" module to work.

## Usage

Installation is quite straightforward. It will install Java 7 and make it the systems default, even if OpenJDK 6 was installed:

  class { 'puppet_java7_squeeze':
    ensure => 'present'
  }

Removal/decommissioning:

  class { 'puppet_java7_squeeze':
    ensure => 'absent',
  }

## Contributions

This is an open source project and your contribution is very much appreciated.

1. Check for open issues or open a fresh issue to start a discussion around a feature idea or a bug.
2. Fork the repository on Github and make your changes on your own branch named after the issue id.
3. Send a pull request.

## License

puppet_java7_squeeze is available under the MIT license. See the [LICENSE](LICENSE) file for more info.