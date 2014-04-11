require 'spec_helper'

describe Division do
  it 'should have a name' do
    build(:division, name: nil).should_not be_valid
  end

  it 'should have a code' do
    build(:division, code: nil).should_not be_valid
  end

  it 'should have a parent_id' do
    build(:division, parent_id: nil).should_not be_valid
  end

  it 'should not allow duplicate code' do
    create(:division, code: '1234')
    build(:division, code: '1234').should_not be_valid
  end
end
