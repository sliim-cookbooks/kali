# -*- coding: utf-8 -*-
#
# Cookbook Name:: kali
# Ohai Plugin:: kali
#

Ohai.plugin(:Kali) do
  provides 'kali_release'
  collect_data do
    release = shell_out('grep -i kali /etc/issue').stdout[/([0-9\.]*) \\n/, 1]
    if release.empty?
      Chef::Log.warn('Failed to detect Kali release for this distro!')
    else
      Chef::Log.info("Detected Kali release: #{release}")
      kali_release release
    end
  end
end
