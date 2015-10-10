# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::top10' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-top10]' do
    expect(subject).to install_package('kali-linux-top10').with(timeout: 1800)
  end
end
