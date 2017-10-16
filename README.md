kali Cookbook | [![Cookbook Version](https://img.shields.io/cookbook/v/kali.svg)](https://community.opscode.com/cookbooks/kali) [![Build Status](https://travis-ci.org/sliim-cookbooks/kali.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/kali) 
==============
This cookbook installs and configures kali linux for debian OS.  
It provides an easy way to manage your pentest environment with Chef!

Requirements
------------
#### cookbooks
- `apt` - https://supermarket.getchef.com/cookbooks/apt
- `ohai` - https://supermarket.getchef.com/cookbooks/ohai

#### platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.  
- `Debian 7.6`
- `Debian 8.1`

Attributes
----------
#### kali::default
|  Key                            |  Type   |  Description                                                           |
| ------------------------------- | ------- | ---------------------------------------------------------------------- |
| `[kali][distribution]`          | String  | Distribution to use for apt repository (default: `sana`)               |
| `[kali][security_distribution]` | String  | Distribution for security repository updates (default: `sana/updates`) |
| `[kali][keyserver]`             | String  | GPG keys server (default: `pgp.mit.edu`)                               |
| `[kali][apt_timeout]`           | Integer | Timeout for packages installation (default: `1800`)                    |

#### kali::rogue-ap
|  Key                              |  Type   |  Description                                                  |
| --------------------------------- | ------- | ------------------------------------------------------------- |
| `[kali][rogue-ap][interface]`     | String  | Wireles interface (default: `wlan0`)                          |
| `[kali][rogue-ap][out_interface]` | String  | Output interface (default: `eth0`)                            |
| `[kali][rogue-ap][script_path]`   | String  | Path for rogue-ap.sh (default: `/root/rogue-ap.sh`)           |
| `[kali][rogue-ap][packages]`      | Array   | List of packages to install. See attribute file for default   |
| `[kali][rogue-ap][dnsmasq]`       | Hash    | Hash of dnsmasq configuration. See attribute file for default |
| `[kali][rogue-ap][hostapd]`       | Hash    | Hash of hostapd configuration. See attribute file for default |

#### kali::openvas
|  Key                           |  Type   |  Description                                                      |
| ------------------------------ | ------- | ----------------------------------------------------------------- |
| `[kali]['openvas'][run_setup]` | Boolean | Setup Openvas after installed, take many time! (default: `false`) |

#### Automatic Attribute
The `kali::default` recipe will add an automatic attribute in your node named `kali_release`.
This attribute contains the current Kali release of your machine, This value is gathered from `/etc/issue` file.

Usage
-----
#### kali::default
Just include `kali` in your node's `run_list`:  

```json
{
"name":"my_node",
  "run_list": [
    "recipe[kali]"
  ]
}
```

This will add kali linux repositories in apt sources and install the base of Kali linux system.  

Additionally, you can include the following recipes as your need, these are based on kali linux metapackages:  
- `all` - All available packages in Kali linux  
- `forensic` - Forensic tools  
- `full` - Default Kali linux install  
- `gpu` - GPU-Powered tools  
- `hud` - Deploy kalihud script  
- `pwtools` - Password Cracking tools  
- `rfid` - RFID tools  
- `sdr` - Software Defined Radio tools  
- `top10` - Top 10 Kali linux tools  
- `voip` - VoIP tools  
- `web` - Web assessment tools  
- `wireless` - Wireless tools  

See the official documentation: http://tools.kali.org/kali-metapackages

Some services can be disabled with following recipes:
- `kali::disable_lightdm` - Disable lightdm service  

#### kali::rogue-ap
Just include `kali::rogue-ap` in your node's `run_list` to setup a Rogue AP:

```json
{
"name":"my_node",
  "run_list": [
    "recipe[kali]",
    "recipe[kali::rogue-ap]"
  ]
}
```

#### kali::openvas
Install openvas and run `openvas-setup` by including `kali::openvas` in your node's `run_list`:

```json
{
"name":"my_node",
  "run_list": [
    "recipe[kali]",
    "recipe[kali::openvas]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
