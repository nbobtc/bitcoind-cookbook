####
#
# Default attributes
#

# Install via `package` (recommended) or by `source`
default['bitcoind']['install_via'] = 'package'

# All these options are used in the upstart script
default['bitcoind']['bin']     = '/usr/bin/bitcoind' # Location of binary
default['bitcoind']['user']    = 'bitcoin' # User to run bitcoind as
default['bitcoind']['group']   = 'bitcoin' # Group to run bitcoind as
default['bitcoind']['piddir']  = '/var/run/bitcoind' # Directory to place pid file
default['bitcoind']['pidfile'] = '/var/run/bitcoind/bitcoind.pid' # Pid file
default['bitcoind']['datadir'] = '/var/lib/bitcoind' # Location to store blockchain and other data
default['bitcoind']['options'] = ''

default['bitcoind']['wallet']['enabled'] = true # Enable wallet rpc operations

default['bitcoind']['config']['file'] = '/etc/bitcoin/bitcoin.conf' # Configuration file
default['bitcoind']['config']['options']  = {} # Options to put into configuration file, see README

# Packages needed to be installed to compile
default['bitcoind']['packages'] = %w{ git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev }
# Configuration flags
default['bitcoind']['source']['configure_flags'] = '--without-miniupnpc --enable-harding'

# repository that is cloned to be compiled
default['bitcoind']['git']['repo'] = 'https://github.com/bitcoin/bitcoin.git'

# Berkeley DB Configuration
default['bitcoind']['berkeley-db']['archive_file'] = 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
