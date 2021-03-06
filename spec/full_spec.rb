require_relative 'spec_helper'

describe 'kali::full' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-full]' do
    expect(subject).to install_package('kali-linux-full').with(timeout: 1800)
  end
end
