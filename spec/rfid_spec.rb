# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::rfid' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.0').converge(described_recipe)
  end

  it 'installs package[kali-linux-rfid]' do
    expect(subject).to install_package('kali-linux-rfid').with(timeout: 1800)
  end
end
