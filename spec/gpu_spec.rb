# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::gpu' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'does install kali-linux-gpu package' do
    expect(subject).to install_package('kali-linux-gpu')
  end
end
