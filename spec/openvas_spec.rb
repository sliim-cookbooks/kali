require_relative 'spec_helper'

describe 'kali::openvas' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs package[openvas]' do
    expect(subject).to install_package('openvas')
  end

  it 'does not run execute[openvas-setup]' do
    expect(subject).to_not run_execute('openvas-setup')
  end

  context 'setup enabled' do
    let(:subject) do
      ChefSpec::SoloRunner.new do |node|
        node.override['kali']['openvas']['run_setup'] = true
      end.converge(described_recipe)
    end

    it 'runs execute[openvas-setup]' do
      expect(subject).to run_execute('openvas-setup')
    end
  end
end
