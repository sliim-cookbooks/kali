kali Cookbook | [![Cookbook Version](https://img.shields.io/cookbook/v/kali.svg)](https://community.opscode.com/cookbooks/kali) [![Build Status](https://travis-ci.org/sliim-cookbooks/kali.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/kali) 
==============
This cookbook installs and configures Kali linux on debian OS.

Requirements
------------
#### cookbooks
- `apt` - https://supermarket.getchef.com/cookbooks/apt

#### platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.  
- `Debian 8`
- `Debian 9`

Attributes
----------
#### kali::default
|  Key                   |  Type   |  Description                                                           |
| ---------------------- | ------- | ---------------------------------------------------------------------- |
| `[kali][distribution]` | String  | Distribution to use for apt repository (default: `kali-rolling`)       |
| `[kali][components]`   | String  | Repository components (default: `[main, non-free, contrib]`)           |
| `[kali][keyserver]`    | String  | GPG keys server (default: `pgp.mit.edu`)                               |
| `[kali][apt_timeout]`  | Integer | Timeout for packages installation (default: `1800`)                    |
| `[kali][upgrade]`      | Boolean | Set true to upgrade kali linux metapackages (default: `false`)         |

#### kali::openvas
|  Key                         |  Type   |  Description                                                      |
| ---------------------------- | ------- | ----------------------------------------------------------------- |
| `[kali][openvas][run_setup]` | Boolean | Setup Openvas after installed, take many time! (default: `false`) |

#### kali::hud
|  Key                    | Type |  Description                                         |
| ----------------------- | ---- | ---------------------------------------------------- |
| `[kali][hud][services]` | Hash | Services list for the kalihud script (default: `{}`) |

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
- `kali::disable_lightdm` - Disable lightdm service  
- `forensic` - Forensic tools  
- `full` - Default Kali linux install  
- `gpu` - GPU-Powered tools  
- `hud` - Deploy kalihud script  
- `openvas` - Basic openvas setup  
- `pwtools` - Password Cracking tools  
- `rfid` - RFID tools  
- `sdr` - Software Defined Radio tools  
- `top10` - Top 10 Kali linux tools  
- `voip` - VoIP tools  
- `web` - Web assessment tools  
- `wireless` - Wireless tools  

See the official documentation: https://tools.kali.org/kali-metapackages

Some services can be disabled with following recipes:
- `kali::disable_lightdm` - Disable lightdm service  

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

#### kali::hud
Install kalihud script:

```json
{
"name":"my_node",
  "run_list": [
    "recipe[kali::hud]"
  ]
}
```

Testing
-------
See [TESTING.md](TESTING.md)

Contributing
------------
See [CONTRIBUTING.md](CONTRIBUTING.md)

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
