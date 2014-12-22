# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::web' do
  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'does install kali-linux-web package' do
    expect(subject).to install_package('kali-linux-web')
  end
end
