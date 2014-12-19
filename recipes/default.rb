#
# Cookbook Name:: bitcoind
# Recipe:: default
#
# Copyright (C) 2014 Joshua Estes
#

include_recipe "bitcoind::#{node['bitcoind']['install_via']}"

# Create bitcoind user and group
user node['bitcoind']['user'] do
  comment 'bitcoind system user'
  system true
  shell '/bin/false'
end

# /var/lib/bitcoind
directory node['bitcoind']['datadir'] do
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
end

# /etc/bitcoin
directory File.dirname(node['bitcoind']['config']['file']) do
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
end

template '/etc/init/bitcoind.conf' do
  source 'init/bitcoind.conf.erb'
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0644
  variables({
    :bin            => node['bitcoind']['bin'],
    :user           => node['bitcoind']['user'],
    :group          => node['bitcoind']['group'],
    :piddir         => node['bitcoind']['piddir'],
    :pidfile        => node['bitcoind']['pidfile'],
    :configfile     => node['bitcoind']['config']['file'],
    :datadir        => node['bitcoind']['datadir'],
    :wallet_enabled => node['bitcoind']['wallet']['enabled'],
    :options        => node['bitcoind']['options']
  })
  notifies :restart, 'service[bitcoind]', :delayed
end

# /etc/bitcoin/bitcoin.conf
template node['bitcoind']['config']['file'] do
  source 'bitcoin.conf.erb'
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0600
  variables(:options => node['bitcoind']['config']['options'])
  notifies :restart, 'service[bitcoind]', :delayed
end

# bitcoind service
service 'bitcoind' do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
