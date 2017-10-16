# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::wireless' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-wireless]' do
    expect(subject).to install_package('kali-linux-wireless')
      .with(timeout: 1800)
  end
end
