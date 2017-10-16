# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::rfid' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-rfid]' do
    expect(subject).to install_package('kali-linux-rfid').with(timeout: 1800)
  end
end
