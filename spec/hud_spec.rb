# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::hud' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'installs package[bc]' do
    expect(subject).to install_package('bc')
  end

  it 'creates cookbook_file[/usr/local/bin/kalihud]' do
    expect(subject).to create_cookbook_file('/usr/local/bin/kalihud')
      .with(owner: 'root',
            group: 'root',
            mode: '0755',
            source: 'hud')
  end
end
