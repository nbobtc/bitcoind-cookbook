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
directory File.dirname(node['bitcoind']['configfile']) do
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
end

template '/etc/init/bitcoind.conf' do
  source 'init/bitcoind.conf.erb'
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0600
  variables(
    :bin            => node['bitcoind']['bin'],
    :user           => node['bitcoind']['user'],
    :group          => node['bitcoind']['group'],
    :piddir         => node['bitcoind']['piddir'],
    :pidfile        => node['bitcoind']['pidfile'],
    :configfile     => node['bitcoind']['configfile'],
    :datadir        => node['bitcoind']['datadir'],
    :wallet_enabled => node['bitcoind']['wallet']['enabled'],
  )
  notifies :restart, 'service[bitcoind]', :immediately
end

# /etc/bitcoin/bitcoin.conf
template node['bitcoind']['configfile'] do
  source node['bitcoind']['conf']['template']
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0600
  variables(
    :options => node['bitcoind']['conf']['options'],
  )
  notifies :restart, 'service[bitcoind]', :immediately
end

# bitcoind service
service 'bitcoind' do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
