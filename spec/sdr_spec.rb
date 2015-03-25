# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::sdr' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-sdr package' do
    expect(subject).to install_package('kali-linux-sdr')
  end
end
