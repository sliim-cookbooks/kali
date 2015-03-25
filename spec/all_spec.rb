# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::all' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-all package' do
    expect(subject).to install_package('kali-linux-all')
  end
end
