# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'kali::forensic' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-forensic]' do
    expect(subject).to install_package('kali-linux-forensic')
      .with(timeout: 1800)
  end
end
