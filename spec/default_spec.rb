# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.0').converge(described_recipe)
  end

  before do
    stub_command(%r{grep -E .* /etc/apt/sources.list}).and_return(false)
  end

  it 'adds apt_repository[kali]' do
    expect(subject).to add_apt_repository('kali')
      .with(uri: 'https://http.kali.org/kali',
            distribution: 'kali-rolling',
            components: ['main', 'non-free', 'contrib'],
            deb_src: true,
            keyserver: 'pgp.mit.edu')
  end

  it 'adds apt_preference[kali]' do
    expect(subject).to add_apt_preference('kali')
      .with(glob: '*',
            pin: 'origin http.kali.org',
            pin_priority: '700')
  end

  it 'installs package[kali-linux]' do
    expect(subject).to install_package('kali-linux').with(timeout: 1800)
  end
end
