name 'kali'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache 2.0'
description 'Installs/Configures kali linux'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'

recipe 'kali::all', 'Install all available packages in Kali linux'
recipe 'kali::default', 'Setup debian with kali linux official repository'
recipe 'kali::forensic', 'Install forensic tools'
recipe 'kali::full', 'Setup the default Kali linux install'
recipe 'kali::gpu', 'Install GPU-Powered tools'
recipe 'kali::pwtools', 'Install Password Cracking tools'
recipe 'kali::rfid', 'Install RFID tools'
recipe 'kali::rogue-ap', 'Setup a Rogue AP'
recipe 'kali::sdr', 'Install Software Defined Radio (SDR) tools'
recipe 'kali::top10', 'Install Top 10 Kali linux tools'
recipe 'kali::voip', 'Install VoIP tools'
recipe 'kali::web', 'Install WebApp Assessment tools'
recipe 'kali::wireless', 'Install wireless tools'

depends 'apt'

supports 'debian'

source_url 'https://github.com/sliim-cookbooks/kali' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/kali/issues' if
  respond_to?(:issues_url)
