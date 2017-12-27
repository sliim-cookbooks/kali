# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::hud' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.0').converge(described_recipe)
  end

  it 'installs package[bc]' do
    expect(subject).to install_package('bc')
  end

  it 'creates template[/usr/local/bin/kalihud]' do
    expect(subject).to create_template('/usr/local/bin/kalihud')
      .with(owner: 'root',
            group: 'root',
            mode: '0755',
            source: 'hud.erb',
            variables: { services: {} })
  end
end
