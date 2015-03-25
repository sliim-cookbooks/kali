# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::wireless' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-wireless package' do
    expect(subject).to install_package('kali-linux-wireless')
  end
end
