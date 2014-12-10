# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.7"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.berkshelf.enabled = true
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.provider "virtualbox" do |vb|
  #  vb.customize ["modifyvm", :id, "--memory", "512"]
  #end
  config.vm.provision "shell", inline: "sudo apt-get update"
  config.vm.provision "chef_solo" do |chef|
    chef.log_level = 'debug'
    chef.run_list = [
      'recipe[bitcoind]',
    ]
  end
end
