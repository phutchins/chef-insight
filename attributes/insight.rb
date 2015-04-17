# Insight configuration
default['insight']['config']['name'] = 'insight-default'
default['insight']['config']['port'] = '3001'
default['insight']['config']['db'] = "$HOME/.insight-default"
default['insight']['config']['network'] = 'livenet'
default['insight']['config']['base_dir'] = '/opt/insight'
default['insight']['config']['revision'] = 'master'
default['insight']['config']['api-repository'] = 'https://github.com/bitpay/insight-api.git'
default['insight']['config']['repository'] = 'https://github.com/bitpay/insight.git'
default['insight']['config']['user'] = 'insight'
default['insight']['config']['bitcoind']['host'] = 'localhost'
default['insight']['config']['enable_email_store'] = false
default['insight']['config']['enable_mailbox'] = false

# Bitcoind configuration
default['insight']['config']['bitcoind']['user'] = 'bitcoin_user'
default['insight']['config']['bitcoind']['pass'] = 'bitcoin_pass'
default['insight']['config']['bitcoind']['port'] = '8333'
default['insight']['config']['bitcoind']['rpcport'] = '8332'

# NVM and NodeJS configuration
default['insight']['nodejs_version'] = 'v0.10.28'
default['insight']['repository'] = 'git://github.com/creationix/nvm.git'
default['insight']['reference'] = 'v0.16.1'
default['insight']['user'] = 'insight'
default['insight']['group'] = 'insight'
default['insight']['user_install'] = true
default['insight']['user_home_dir'] = '/opt/insight'

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
