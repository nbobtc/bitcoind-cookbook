####
#
# Adds bitcoin as package
#
bash 'add-apt-repository_and_update' do
  code <<-EOH
    add-apt-repository ppa:bitcoin/bitcoin --yes
    apt-get update
  EOH
end

package 'bitcoind' do
  action :install
end
