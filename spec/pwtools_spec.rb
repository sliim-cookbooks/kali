# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::pwtools' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-pwtools package' do
    expect(subject).to install_package('kali-linux-pwtools').with(timeout: 1800)
  end
end
