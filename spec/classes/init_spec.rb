require 'spec_helper'
describe 'aptsimplesoftware' do
  context 'with default values for all parameters' do
    it { should contain_class('aptsimplesoftware') }
  end
end
