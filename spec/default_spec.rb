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

  it 'installs package[apt-transport-https]' do
    expect(subject).to install_package('apt-transport-https')
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
    expect(subject).to install_package('kali-linux').with(timeout: 1800, action: [:install])
  end

  context 'with upgrade attribute' do
    let(:subject) do
      ChefSpec::SoloRunner.new(platform: 'debian',
                               version: '9.0') do |node|
        node.override['kali']['upgrade'] = true
      end.converge(described_recipe)
    end

    it 'upgrades package[kali-linux]' do
      expect(subject).to upgrade_package('kali-linux').with(timeout: 1800, action: [:upgrade])
    end
  end
end
