#
# Cookbook Name:: chef-insight
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

user node['insight']['config']['user'] do
  home node['insight']['config']['base_dir']
  shell '/bin/bash'
  action :create
end

node['insight']['add_groups'].each do |my_group|
  group my_group do
    action :create
    members node['insight']['config']['user']
    append true
  end
end

directory node['insight']['config']['base_dir'] do
  owner node['insight']['config']['user']
  group node['insight']['config']['group']
  recursive true
  action :create
end

include_recipe 'insight::install-dependencies'
include_recipe 'insight::install-bitcoind'

directory node['insight']['config']['log_dir'] do
  owner node['insight']['config']['user']
  group node['insight']['config']['group']
  recursive true
  action :create
end

link '/var/log/insight' do
  to node['insight']['config']['log_dir']
  action :create
end if node['insight']['config']['link_logs']

file 'insight.logrotate' do
  path '/etc/logrotate.d/insight'
  action :create
end

node['insight']['instances'].each do |instance|
  config_merged = instance[1].to_hash
  node['insight']['config'].each do |key, value|
    config_merged[key] = value unless config_merged.has_key? key
  end

  if node['insight']['log_to_file']
    logger_string = ">> #{File.join(node['insight']['config']['log_dir'], config_merged['name']+".log")} 2>&1"
  else
    logger_string = ""
  end

  instance_dir = File.join(config_merged['base_dir'], config_merged['name'])
  template "/etc/init/#{config_merged['name']}.conf" do
    source "insight.conf.erb"
    variables ({
      :instance_dir => instance_dir,
      :insight_home => config_merged['base_dir'],
      :insight_user => config_merged['user'],
      :insight_port => config_merged['port'],
      :insight_db => config_merged['db'],
      :insight_mailbox => config_merged['enable_mailbox'],
      :insight_network => config_merged['network'],
      :logger_string => logger_string,
      :bitcoind_user => config_merged['bitcoind']['user'],
      :bitcoind_pass => config_merged['bitcoind']['pass'],
      :bitcoind_host => config_merged['bitcoind']['host'],
      :bitcoind_port => config_merged['bitcoind']['port'],
      :bitcoind_rpcport => config_merged['bitcoind']['rpcport'],
      :bitcoind_datadir_local => config_merged['bitcoind']['data_dir_local'],
      :bitcoind_datadir => File.join(config_merged['bitcoind']['data_dir'], '/'),
      :insight_enable_ratelimiter => config_merged['enable_ratelimiter'],
      :insight_enable_monitor => config_merged['enable_monitor'],
      :insight_enable_emailstore => config_merged['enable_emailstore'],
      :insight_email_confirm_host => config_merged['email_confirm_host']
   })
    action :create
  end

  permissions_script = <<-SCRIPT
    find #{config_merged['bitcoind']['data_dir']} -type d -print0 | xargs -0 chmod 2750
    find #{config_merged['bitcoind']['data_dir']} -type f -print0 | xargs -0 chmod 0640
  SCRIPT

  file "/usr/local/bin/fix_bitcoind_perms_for_insight_#{config_merged['name']}" do
    content permissions_script
    owner "root"
    group "root"
    mode 00755
  end

  script "run_fix_bitcoind_perms_#{config_merged['name']}" do
    interpreter "bash"
    user "root"
    code <<-EOH
      /usr/local/bin/fix_bitcoind_perms_for_insight_#{config_merged['name']}
    EOH
  end

  git File.join(instance_dir) do
    user config_merged['user']
    group config_merged['group']
    repository config_merged['api-repository']
    revision config_merged['revision']
    action :sync
    notifies :run, "script[insight_api_setup_#{config_merged['name']}]", :immediately
  end

  # For some reason this doesn't seem to be running
  script "insight_api_setup_#{config_merged['name']}" do
    interpreter 'bash'
    user config_merged['user']
    cwd File.join(instance_dir)
    environment Hash[ 'HOME' => node['insight']['user_home_dir'] ]
    flags '-l'
    # This needs to source nvm from the correct location depending on if a user install was used or global. It is currently hardcoded to user.
    code <<-EOH
      source ~/.nvm/nvm.sh
      npm install
    EOH
    #action :nothing
  end

  service config_merged['name'] do
    action :start
  end
end

include_recipe 'nginx'
