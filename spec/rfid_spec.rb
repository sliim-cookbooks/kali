# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::rfid' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'does install kali-linux-rfid package' do
    expect(subject).to install_package('kali-linux-rfid')
  end
end
