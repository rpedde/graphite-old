maintainer       "Rackspace Hosting"
maintainer_email "osops@lists.launchpad.net"
license          "Apache 2.0"
description      "Installs/Configures graphite"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends          "apt"
depends          "apache2"
depends          "collectd"
depends          "collectd-plugins"
depends          "osops-utils"

