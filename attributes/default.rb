####
#
# Default attributes
#

# Install via `package` (recommended) or by `source`
default['bitcoind']['install_via'] = 'package'

default['bitcoind']['bin']        = '/usr/bin/bitcoind'
default['bitcoind']['user']       = 'bitcoin'
default['bitcoind']['group']      = 'bitcoin'
default['bitcoind']['piddir']     = '/var/run/bitcoind'
default['bitcoind']['pidfile']    = '/var/run/bitcoind/bitcoind.pid'
default['bitcoind']['configfile'] = '/etc/bitcoin/bitcoin.conf'
default['bitcoind']['datadir']    = '/var/lib/bitcoind'

# Used in the init script
default['bitcoind']['wallet']['enabled'] = true

# Template to use
default['bitcoind']['conf']['template'] = 'bitcoin.conf.erb'
default['bitcoind']['conf']['options']  = {}

# Packages needed to be installed to compile
default['bitcoind']['packages'] = %w{ git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev }
# Configuration flags
default['bitcoind']['source']['configure_flags'] = '--without-miniupnpc --enable-harding'

# repository that is cloned to be compiled
default['bitcoind']['git']['repo'] = 'https://github.com/bitcoin/bitcoin.git'

# Berkeley DB Configuration
default['bitcoind']['berkeley-db']['archive_file'] = 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
