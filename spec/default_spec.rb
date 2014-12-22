# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::default' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'does create apt source for kali repository' do
    expect(subject).to add_apt_repository('kali')
      .with(uri: 'http://http.kali.org/kali',
            distribution: 'kali',
            components: ['main', 'non-free', 'contrib'],
            deb_src: true)
  end

  it 'does create apt source for kali security updates' do
    expect(subject).to add_apt_repository('kali-security')
      .with(uri: 'http://security.kali.org/kali-security',
            distribution: 'kali/updates',
            components: ['main', 'non-free', 'contrib'],
            deb_src: false)
  end

  it 'does create apt preference file for kali repository' do
    expect(subject).to add_apt_preference('kali')
      .with(glob: '*',
            pin: 'origin http.kali.org',
            pin_priority: '700')
  end

  it 'does install kali-linux package' do
    expect(subject).to install_package('kali-linux')
  end
end
