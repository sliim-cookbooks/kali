# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::disable_lightdm' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian',
                             version: '9.0').converge(described_recipe)
  end

  it 'disables service[lightdm]' do
    expect(subject).to disable_service('lightdm')
  end
end
