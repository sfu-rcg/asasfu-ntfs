require 'spec_helper'
describe 'ntfs' do

  context 'with defaults for all parameters' do
    it { should contain_class('ntfs') }
  end
end
