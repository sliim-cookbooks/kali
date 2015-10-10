# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::all' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-all]' do
    expect(subject).to install_package('kali-linux-all').with(timeout: 1800)
  end
end
