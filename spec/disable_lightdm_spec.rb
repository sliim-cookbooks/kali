# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::disable_lightdm' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'disables service[lightdm]' do
    expect(subject).to disable_service('lightdm')
  end
end
