require_relative 'spec_helper'

describe 'kali::disable_lightdm' do
  let(:subject) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'disables service[lightdm]' do
    expect(subject).to disable_service('lightdm')
  end
end
