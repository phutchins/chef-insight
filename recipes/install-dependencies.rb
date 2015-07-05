%w[build-essential libssl-dev curl libcurl3].each do |pkg|
  package pkg do
    action :install
  end
end

# NVM and NodeJS configuration
include_recipe 'nvm'
nvm_install "install insight nvm" do
  version node['nvm']['nodejs_version']
  user node['insight']['config']['user']
  group node['insight']['config']['group']
  user_home node['insight']['nvm']['user_home_dir']
  from_source false
  alias_as_default true
  action :create
end
