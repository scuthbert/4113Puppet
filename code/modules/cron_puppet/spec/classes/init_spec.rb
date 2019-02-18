require 'spec_helper'
describe 'cron_puppet' do
  context 'with default values for all parameters' do
    it { should contain_class('cron_puppet') }
  end
end
