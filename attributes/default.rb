####
#
# Default attributes
#

#BITCOIND_BIN="/usr/bin/bitcoind"
#BITCOIND_USER="bitcoin"
#BITCOIND_GROUP="bitcoin"
#BITCOIND_PIDDIR="/var/run/bitcoind"
#BITCOIND_PIDFILE="/var/run/bitcoind/bitcoind.pid"
#BITCOIND_CONFIGFILE="/etc/bitcoin/bitcoin.conf"
#BITCOIND_DATADIR="/var/lib/bitcoind"

# Install via `package` (recommended) or by `source`
default['bitcoind']['install_via'] = 'package'

# User/Group to run bitcoin as
default['bitcoind']['user']  = 'bitcoin'
default['bitcoind']['group'] = 'bitcoin'

# Packages needed to be installed to compile
default['bitcoind']['packages'] = %w{ git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev }
# Configuration flags
default['bitcoind']['source']['configure_flags'] = '--without-miniupnpc --enable-harding'

# Where to keep the data files
default['bitcoind']['datadir'] = '/etc/bitcoin'

# Template to use
default['bitcoind']['conf']['template'] = 'bitcoin.conf.erb'
default['bitcoind']['conf']['options'] = {
  '#testnet'    => '1',
  'server'      => '1',
  'rpcssl'      => '1',
  'rpcport'     => '8333',
  'rpcuser'     => 'changeme',
  'rpcpassword' => 'YourSuperGreatPasswordNumber_DO_NOT_USE_THIS_OR_YOU_WILL_GET_ROBBED_385593',
}

# repository that is cloned to be compiled
default['bitcoind']['git']['repo'] = 'https://github.com/bitcoin/bitcoin.git'

# Berkeley DB Configuration
default['bitcoind']['berkeley-db']['archive_file'] = 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
