require_relative 'spec_helper'

describe 'kali::voip' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-voip]' do
    expect(subject).to install_package('kali-linux-voip').with(timeout: 1800)
  end
end
