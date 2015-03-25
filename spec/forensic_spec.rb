# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::forensic' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'should install kali-linux-forensic package' do
    expect(subject).to install_package('kali-linux-forensic')
  end
end
