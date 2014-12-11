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
  #gid node['bitcoind']['group']
  system true
  shell '/bin/false'
end

####
#
# /etc/bitcoin/bitcoin.conf file
#
template "#{node['bitcoind']['datadir']}/bitcoin.conf" do
  source node['bitcoind']['conf']['template']
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0600
  variables(:options => node['bitcoind']['conf']['options'])
end
