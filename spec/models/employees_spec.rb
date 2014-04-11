require 'spec_helper'

describe Employee do
  it 'should have a code' do
    build(:employee, code: nil).should_not be_valid
  end

  it 'should have a name' do
    build(:employee, name: nil).should_not be_valid
  end

  it 'should have a designation' do
    build(:employee, designation: nil).should_not be_valid
  end

  it 'should have a department' do
    build(:employee, department_id: nil).should_not be_valid
  end

  it 'should have a manager' do
    build(:employee, manager_id: nil).should_not be_valid
  end

  it 'should not allow duplicate code' do
    create(:employee, code: '1001', department_id: '1')
    build(:employee, code: '1001').should_not be_valid
  end
end
