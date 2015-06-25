# chef-insight

This cookbook installs and configures insight and insight-api

## Platform:

* Ubuntu
(Currently this is only tested on Ubuntu 14.04 but has been written such that it should support others)


## Attributes
See `attributes/insight.rb` for default values.

#### Insight configuration
`default['insight']['add_groups']` - [Array of Strings] Additional groups to put the insight user into. This is being used to add insight to the bitcoind group so that it can read bitcoind's data files
`default['insight']['log_to_file']` - [Boolean] - Value to turn logging to file on or off
`default['insight']['link_logs']` - [Boolean] - Value to turn linking logs directory to /var/log on or off
`default['insight']['config']['name']` - [String] - 'insight-default'
`default['insight']['config']['base_dir']` - [String] - '/opt/insight'
`default['insight']['config']['link_data']` - [Boolean] - Link the insight data dir to somewhere other than the default
`default['insight']['config']['link_data_dir']` - [Boolean] - Where to link the insight data dir to if link_data is enabled
`default['insight']['config']['port']` - [String] - Port number for insight to listen on
`default['insight']['config']['db']` - [String] - Location for insight data files
`default['insight']['config']['network']` = [String] - Bitcoind network. [livenet, testnet]
`default['insight']['config']['revision']` - [String] - Git revision for insight or insight-api
`default['insight']['config']['api-repository']` - [String] - Git uri for the insight-api repository
`default['insight']['config']['repository']` - [String] - Git uri for the insight repository
`default['insight']['config']['user']` - [String] - User under which insight will run
`default['insight']['config']['group']` - [String] - Group under which insight will run
`default['insight']['config']['bitcoind']['host']` - [String] - Hostname or IP for bitcoind host
`default['insight']['config']['enable_email_store']` - [Boolean] - Enable email store
`default['insight']['config']['enable_mailbox']` - [Boolean] - Enable mailbox
`default['insight']['config']['log_dir']` - [String] -  Directory for insight logs

#### Bitcoind configuration
`default['insight']['config']['bitcoind']['user']` - [String] - Username for bitcoind rpc
`default['insight']['config']['bitcoind']['pass']` - [String] - Password for bitcoind rpc
`default['insight']['config']['bitcoind']['port']` - [String] - Port for bitcoind
`default['insight']['config']['bitcoind']['rpcport']` - [String] - Port for bitcoind rpc

#### NVM and NodeJS configuration
`default['insight']['nvm']['nodejs_version']` - [String] - NodeJS version to run
`default['insight']['nvm']['repository']` - [String] - NVM repository location
`default['insight']['nvm']['reference']` - [String] - NVM Version
`default['insight']['nvm']['user']` - [String] - User for which to install NVM
`default['insight']['nvm']['group']` - [String] - Group for user we're installing NVM for
`default['insight']['nvm']['user_install']` - [Boolean] - If this is a user install or system wide
`default['insight']['nvm']['user_home_dir']` - [String] - Home directory of user we're installing NVM for

#### Example of how to use multiple instances
`default['insight']['instances']['insight-testnet']['name']` = 'insight-testnet'
`default['insight']['instances']['insight-testnet']['port']` = '3001'
`default['insight']['instances']['insight-testnet']['db']` = "$HOME/.insight-testnet"
`default['insight']['instances']['insight-testnet']['enable_mailbox']` = true
`default['insight']['instances']['insight-testnet']['network']` = 'testnet'
`default['insight']['instances']['insight-testnet']['bitcoind']['user']` = 'bitcoin_user'
`default['insight']['instances']['insight-testnet']['bitcoind']['pass']` = 'bitcoin_pass'
`default['insight']['instances']['insight-testnet']['bitcoind']['port']` = '18333'
`default['insight']['instances']['insight-testnet']['bitcoind']['rpcport']` = '18332'
`
`default['insight']['instances']['insight-livenet']['name']` = 'insight-livenet'
`default['insight']['instances']['insight-livenet']['port']` = '4001'
`default['insight']['instances']['insight-livenet']['db']` = "$HOME/.insight-livenet"
`default['insight']['instances']['insight-livenet']['enable_mailbox']` = true
`default['insight']['instances']['insight-livenet']['network']` = 'livenet'
`default['insight']['instances']['insight-livenet']['bitcoind']['user']` = 'bitcoin_user'
`default['insight']['instances']['insight-livenet']['bitcoind']['pass']` = 'bitcoind_pass'
`default['insight']['instances']['insight-livenet']['bitcoind']['port']` = '8333'
`default['insight']['instances']['insight-livenet']['bitcoind']['rpcport']` = '8332'


## Recipes

`default` - Calls the insight-api recipe and installs insight-api only
`insight-api` - Installs insight api only
`insight` - Installs insight api and UI
`install-bitcoind` - Automatically called and installs and configures bitcoind
`install-dependencies` - Handles installing all of the dependencies for insight


## Usage

Add `recipe[insight]` to your nodes runlist or role, or icnlude it in another cookbook.


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Author

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Philip Hutchins (<flipture@gmail.com>)
| **License:**         | Apache License, Version 2.0

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
