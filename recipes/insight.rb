#
# Cookbook Name:: chef-insight
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

user node['insight']['user'] do
  home node['insight']['base_dir']
  shell '/bin/bash'
  action :create
end

directory node['insight']['base_dir'] do
  owner node['insight']['user']
  group node['insight']['user']
  recursive true
  action :create
end

include_recipe 'insight::install-dependencies'

include_recipe 'insight::install-bitcoind'

instances = ['insight-prod', 'insight-testnet']

instances.each do |instance|
  git File.join(node['insight']['base_dir'], instance) do
    user node['insight']['user']
    group node['insight']['user']
    repository node['insight']['repository']
    revision node['insight']['revision']
    action :sync
    notifies :run, "script[insight_setup_#{instance}]", :immediately
  end

  script "insight_setup_#{instance}" do
    interpreter 'bash'
    user node['insight']['user']
    cwd File.join(node['insight']['base_dir'], instance)
    flags '-l'
    command "npm install"
    action :nothing
  end
end

include_recipe 'nginx'
