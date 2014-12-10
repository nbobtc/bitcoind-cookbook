####
#
# Default attributes
#

# User/Group to run bitcoin as
default['bitcoind']['user']  = 'bitcoind'
default['bitcoind']['group'] = 'bitcoind'

# Packages needed to be installed to compile
default['bitcoind']['packages'] = %w{ git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libdb-dev }
# Configuration flags
default['bitcoind']['source']['configure_flags'] = '--without-miniupnpc --enable-harding'

# Where to keep the data files
default['bitcoind']['datadir'] = '/etc/bitcoin'

# Template to use
default['bitcoind']['conf']['template'] = 'bitcoin.conf.erb'
default['bitcoind']['conf']['options'] = {'#test' => 'true'}

# repository that is cloned to be compiled
default['bitcoind']['git']['repo'] = 'https://github.com/bitcoin/bitcoin.git'
