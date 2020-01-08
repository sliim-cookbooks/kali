require_relative 'spec_helper'

describe 'kali::rfid' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-rfid]' do
    expect(subject).to install_package('kali-linux-rfid').with(timeout: 1800)
  end
end
