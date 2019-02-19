require 'spec_helper'
describe 'dm_employees' do
  context 'with default values for all parameters' do
    it { should contain_class('dm_employees') }
  end
end
