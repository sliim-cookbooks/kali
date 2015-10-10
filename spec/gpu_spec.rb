# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::gpu' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs package[kali-linux-gpu]' do
    expect(subject).to install_package('kali-linux-gpu').with(timeout: 1800)
  end
end
