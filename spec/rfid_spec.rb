# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::rfid' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-rfid package' do
    expect(subject).to install_package('kali-linux-rfid').with(timeout: 1800)
  end
end
