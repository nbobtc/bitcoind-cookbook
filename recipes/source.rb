#
# Cookbook Name:: bitcoind
# Recipe:: default
#
# Copyright (C) 2014 Joshua Estes
#

node['bitcoind']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

# Create data dir
directory node['bitcoind']['datadir'] do
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0700
end

directory '/opt/bitcoin' do
end

git '/opt/bitcoin' do
  repository node['bitcoind']['git']['repo']
  action :sync
end

# Split this big ass section up
# Allow enable/disable wallet support
# enabled/disable berkeley
bash 'compile_berkeleydb_and_bitcoin' do
  cwd '/opt/bitcoin'
  code <<-EOH
    BITCOIN_ROOT=/opt/bitcoin
    BDB_PREFIX="${BITCOIN_ROOT}/db4"
    mkdir -p $BDB_PREFIX
    wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
    echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c
    tar -xzvf db-4.8.30.NC.tar.gz
    cd db-4.8.30.NC/build_unix/
    ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX
    make install
    cd $BITCOIN_ROOT
    ./autogen.sh
    ./configure #{node['bitcoind']['source']['configure_flags']} LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/" || ( cat config.log && false)
    make
    make install
  EOH
end

#bash 'compile_bitcoind' do
#  cwd '/opt/bitcoin'
#  code <<-EOH
#    BDB_PREFIX="${BITCOIN_ROOT}/db4"
#    ./autogen.sh
#    ./configure #{node['bitcoind']['source']['configure_flags']} LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/"
#    make
#  EOH
#end

#template "/etc/init.d/bitcoin.conf" do
#  source 'init.d/bitcon.conf.erb'
#  owner node['bitcoind']['user']
#  group node['bitcoind']['group']
#end
#service 'bitcoin' do
#  action [:enable, :start]
#end
