# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::openvas' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.0').converge(described_recipe)
  end

  it 'installs package[openvas]' do
    expect(subject).to install_package('openvas')
  end

  it 'does not run execute[openvas-setup]' do
    expect(subject).to_not run_execute('openvas-setup')
  end

  context 'setup enabled' do
    let(:subject) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '9.0') do |node|
        node.override['kali']['openvas']['run_setup'] = true
      end.converge(described_recipe)
    end

    it 'runs execute[openvas-setup]' do
      expect(subject).to run_execute('openvas-setup')
    end
  end
end
