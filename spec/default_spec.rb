# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::default' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should create apt source for kali repository' do
    expect(subject).to add_apt_repository('kali')
      .with(uri: 'http://http.kali.org/kali',
            distribution: 'sana',
            components: ['main', 'non-free', 'contrib'],
            deb_src: true,
            keyserver: 'pgp.mit.edu',
            key: 'ED444FF07D8D0BF6')
  end

  it 'should create apt source for kali security updates' do
    expect(subject).to add_apt_repository('kali-security')
      .with(uri: 'http://security.kali.org/kali-security',
            distribution: 'sana/updates',
            components: ['main', 'non-free', 'contrib'],
            deb_src: false,
            keyserver: 'pgp.mit.edu',
            key: 'ED444FF07D8D0BF6')
  end

  it 'should create apt preference file for kali repository' do
    expect(subject).to add_apt_preference('kali')
      .with(glob: '*',
            pin: 'origin http.kali.org',
            pin_priority: '700')
  end

  it 'should install kali-linux package' do
    expect(subject).to install_package('kali-linux').with(timeout: 1800)
  end
end
