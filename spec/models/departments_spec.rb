require 'spec_helper'

describe Department do
  it 'should have a name' do
    build(:department, name: nil).should_not be_valid
  end

  it 'should have a code' do
    build(:department, code: nil).should_not be_valid
  end

  it 'should have a kind' do
    build(:department, kind: nil).should_not be_valid
  end

  it 'should not allow duplicate code' do
    create(:department, code: '1234')
    build(:department, code: '1234').should_not be_valid
  end
end
