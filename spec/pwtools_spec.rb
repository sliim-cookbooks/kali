# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::pwtools' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-pwtools]' do
    expect(subject).to install_package('kali-linux-pwtools').with(timeout: 1800)
  end
end
