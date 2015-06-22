%w[build-essential libssl-dev curl libcurl3].each do |pkg|
  package pkg do
    action :install
  end
end

# NVM and NodeJS configuration
node.set['nvm']['nodejs_version'] = node['insight']['nvm']['nodejs_version']
node.set['nvm']['repository'] = node['insight']['nvm']['repository']
node.set['nvm']['reference'] = node['insight']['nvm']['reference']
node.set['nvm']['user'] = node['insight']['nvm']['user']
node.set['nvm']['group'] = node['insight']['nvm']['group']
node.set['nvm']['user_install'] = node['insight']['nvm']['user_install']
node.set['nvm']['user_home_dir'] = node['insight']['nvm']['user_home_dir']

include_recipe 'nvm'
nvm_install node['nvm']['nodejs_version'] do
  user node['insight']['config']['user']
  group node['insight']['config']['group']
  from_source false
  alias_as_default true
  action :create
end
