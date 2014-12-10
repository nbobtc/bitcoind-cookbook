#
# Cookbook Name:: bitcoind
# Recipe:: default
#
# Copyright (C) 2014 Joshua Estes
#

# Create bitcoind user and group
user node['bitcoind']['user'] do
  comment 'bitcoind system user'
  gid node['bitcoind']['group']
  system true
  shell '/bin/false'
end

# Create data dir
directory node['bitcoind']['datadir'] do
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0700
end

# Template
template "#{node['bitcoind']['datadir']}/bitcoin.conf" do
  source node['bitcoind']['conf']['template']
  owner node['bitcoind']['user']
  group node['bitcoind']['group']
  mode 0600
  variables(:options => node['bitcoind']['conf']['options'])
end

service 'bitcoin' do
  action [:enable, :start]
end
