# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::web' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-web]' do
    expect(subject).to install_package('kali-linux-web').with(timeout: 1800)
  end
end
