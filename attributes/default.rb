# -*- coding: utf-8 -*-
#
# Cookbook Name:: kali
# Attributes:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['kali']['distribution'] = 'kali-rolling'
default['kali']['components'] = ['main', 'non-free', 'contrib']
default['kali']['keyserver'] = 'pgp.mit.edu'
default['kali']['apt_timeout'] = 1800
default['kali']['upgrade'] = false

# kali::hud
default['kali']['hud']['services'] = {}

# kali::openvas
default['kali']['openvas']['run_setup'] = false

# kali::rogue-ap
default['kali']['rogue-ap']['interface'] = 'wlan0'
default['kali']['rogue-ap']['out_interface'] = 'eth0'
default['kali']['rogue-ap']['script_path'] = '/root/rogue-ap.sh'
default['kali']['rogue-ap']['packages'] = ['hostapd',
                                           'dnsmasq',
                                           'wireless-tools',
                                           'iw', 'wvdial']
default['kali']['rogue-ap']['dnsmasq'] = {
  'log-facility' => '/var/log/dnsmasq.log',
  'interface' => node['kali']['rogue-ap']['interface'],
  'dhcp-range' => '10.0.0.10,10.0.0.250,12h',
  'dhcp-option' => ['3,10.0.0.1', '6,10.0.0.1'],
}

default['kali']['rogue-ap']['hostapd'] = {
  'interface' => node['kali']['rogue-ap']['interface'],
  'driver' => 'nl80211',
  'ssid' => 'FreeWifi',
  'channel' => 1,
}
