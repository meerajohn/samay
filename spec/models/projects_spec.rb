require 'spec_helper'

describe Project do
  it 'should have a division' do
    build(:project, division_id: nil).should_not be_valid
  end

  it 'should have a client' do
    build(:project, client_id: nil).should_not be_valid
  end

  it 'should have a code' do
    build(:project, code: nil).should_not be_valid
  end

  it 'should have a name' do
    build(:project, name: nil).should_not be_valid
  end

  it 'should not allow duplicate code' do
    create(:employee, code: '1001', department_id: '1')
    build(:employee, code: '1001').should_not be_valid
  end
end
