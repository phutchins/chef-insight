# Insight configuration
default['insight']['add_groups'] = ['bitcoind']
default['insight']['log_to_file'] = true
default['insight']['link_logs'] = true
default['insight']['config']['name'] = 'insight-default'
default['insight']['config']['base_dir'] = '/opt/insight'
default['insight']['config']['link_data'] = false
default['insight']['config']['link_data_dir'] = '/data'
default['insight']['config']['port'] = '3001'
default['insight']['config']['db'] = "$HOME/.insight-default"
default['insight']['config']['network'] = 'livenet'
default['insight']['config']['revision'] = 'master'
default['insight']['config']['api-repository'] = 'https://github.com/bitpay/insight-api.git'
default['insight']['config']['repository'] = 'https://github.com/bitpay/insight.git'
default['insight']['config']['user'] = 'insight'
default['insight']['config']['group'] = 'insight'
default['insight']['config']['bitcoind']['host'] = 'localhost'
default['insight']['config']['enable_email_store'] = false
default['insight']['config']['log_dir'] = File.join(node['insight']['config']['base_dir'], "log")
default['insight']['config']['ratelimiter'] =  false
default['insight']['config']['monitor'] = false
default['insight']['config']['enable_mailbox'] = false
default['insight']['config']['enable_emailstore'] = false
default['insight']['config']['email_confirm_host'] = ''


# Bitcoind configuration
default['insight']['config']['bitcoind']['user'] = 'bitcoin_user'
default['insight']['config']['bitcoind']['pass'] = 'bitcoin_pass'
default['insight']['config']['bitcoind']['port'] = '8333'
default['insight']['config']['bitcoind']['rpcport'] = '8332'

# NVM and NodeJS configuration
default['insight']['nvm']['nodejs_version'] = 'v0.10.28'
default['insight']['nvm']['repository'] = 'git://github.com/creationix/nvm.git'
default['insight']['nvm']['reference'] = 'v0.16.1'
default['insight']['nvm']['user'] = 'insight'
default['insight']['nvm']['group'] = 'insight'
default['insight']['nvm']['user_install'] = true
default['insight']['nvm']['user_home_dir'] = '/opt/insight'

# Example of how to use multiple instances
#default['insight']['instances']['insight-testnet']['name'] = 'insight-testnet'
#default['insight']['instances']['insight-testnet']['port'] = '3001'
#default['insight']['instances']['insight-testnet']['db'] = "$HOME/.insight-testnet"
#default['insight']['instances']['insight-testnet']['enable_mailbox'] = true
#default['insight']['instances']['insight-testnet']['network'] = 'testnet'
#default['insight']['instances']['insight-testnet']['bitcoind']['user'] = 'bitcoin_user'
#default['insight']['instances']['insight-testnet']['bitcoind']['pass'] = 'bitcoin_pass'
#default['insight']['instances']['insight-testnet']['bitcoind']['port'] = '18333'
#default['insight']['instances']['insight-testnet']['bitcoind']['rpcport'] = '18332'

#default['insight']['instances']['insight-livenet']['name'] = 'insight-livenet'
#default['insight']['instances']['insight-livenet']['port'] = '4001'
#default['insight']['instances']['insight-livenet']['db'] = "$HOME/.insight-livenet"
#default['insight']['instances']['insight-livenet']['enable_mailbox'] = true
#default['insight']['instances']['insight-livenet']['network'] = 'livenet'
#default['insight']['instances']['insight-livenet']['bitcoind']['user'] = 'bitcoin_user'
#default['insight']['instances']['insight-livenet']['bitcoind']['pass'] = 'bitcoind_pass'
#default['insight']['instances']['insight-livenet']['bitcoind']['port'] = '8333'
#default['insight']['instances']['insight-livenet']['bitcoind']['rpcport'] = '8332'
