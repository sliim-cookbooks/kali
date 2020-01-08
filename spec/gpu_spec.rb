require_relative 'spec_helper'

describe 'kali::gpu' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-gpu]' do
    expect(subject).to install_package('kali-linux-gpu').with(timeout: 1800)
  end
end
