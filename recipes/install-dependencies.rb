%w[build-essential libssl-dev curl libcurl3].each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe 'nvm'
nvm_install node['nvm']['nodejs_version'] do
  user node['insight']['config']['user']
  group node['insight']['config']['user']
  from_source false
  alias_as_default true
  action :create
end
