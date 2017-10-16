# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::wireless' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.0').converge(described_recipe)
  end

  it 'installs package[kali-linux-wireless]' do
    expect(subject).to install_package('kali-linux-wireless')
      .with(timeout: 1800)
  end
end
