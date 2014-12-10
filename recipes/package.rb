bash 'add-apt-repository_and_update' do
  code <<-EOH
    add-apt-repository ppa:bitcoin/bitcoin
    apt-get update
    apt-get install bitcoin
  EOH
end
