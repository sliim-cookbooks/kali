# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::sdr' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-sdr]' do
    expect(subject).to install_package('kali-linux-sdr').with(timeout: 1800)
  end
end
