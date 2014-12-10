####
#
# Default attributes
#

default['bitcoind']['user']  = 'bitcoind'
default['bitcoind']['group'] = 'bitcoind'
default['bitcoind']['packages'] = %w{ git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev }
default['bitcoind']['source']['configure_flags'] = '--without-miniupnpc --enable-harding'
default['bitcoind']['datadir'] = '/etc/bitcoin'
default['bitcoind']['conf']['template'] = 'bitcoin.conf.erb'
default['bitcoind']['conf']['options'] = {}
default['bitcoind']['wallet']['enabled'] = false
