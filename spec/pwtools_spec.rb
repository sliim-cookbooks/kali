require_relative 'spec_helper'

describe 'kali::pwtools' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[kali-linux-pwtools]' do
    expect(subject).to install_package('kali-linux-pwtools').with(timeout: 1800)
  end
end
