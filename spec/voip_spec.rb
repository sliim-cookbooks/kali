# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::voip' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-voip package' do
    expect(subject).to install_package('kali-linux-voip')
  end
end
