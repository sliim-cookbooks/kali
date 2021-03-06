require_relative 'spec_helper'

describe 'kali::wireless' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-wireless]' do
    expect(subject).to install_package('kali-linux-wireless')
      .with(timeout: 1800)
  end
end
