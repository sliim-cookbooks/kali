# -*- coding: utf-8 -*-
#
# Cookbook Name:: kali
# Recipe:: default
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

include_recipe 'apt'

package 'apt-transport-https'

apt_repository 'kali' do
  uri 'https://http.kali.org/kali'
  distribution node['kali']['distribution']
  components ['main', 'non-free', 'contrib']
  deb_src true
  keyserver node['kali']['keyserver']
  key 'ED444FF07D8D0BF6'
  not_if 'grep -E "^deb( )+(\")?http(s)?://http.kali.org" /etc/apt/sources.list'
  not_if 'grep -E "^deb( )+(\")?\"http(s)?://http.kali.org" /etc/apt/sources.list.d/kali.list'
end

apt_preference 'kali' do
  glob '*'
  pin 'origin http.kali.org'
  pin_priority '700'
end

apt_repository 'kali-security' do
  uri 'https://security.kali.org/kali-security'
  distribution node['kali']['security_distribution']
  components ['main', 'non-free', 'contrib']
  deb_src false
  keyserver node['kali']['keyserver']
  key 'ED444FF07D8D0BF6'
  only_if { node['kali']['security_distribution'] }
end

package 'kali-linux' do
  timeout node['kali']['apt_timeout']
end
