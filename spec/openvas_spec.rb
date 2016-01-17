# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::openvas' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs package[openvas]' do
    expect(subject).to install_package('openvas')
  end

  it 'runs execute[openvas-setup]' do
    expect(subject).to run_execute('openvas-setup')
  end
end
