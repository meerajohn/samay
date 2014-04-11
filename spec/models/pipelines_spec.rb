require 'spec_helper'

describe Pipeline do
  it 'should have an project_id' do
    build(:pipeline, project_id: nil).should_not be_valid
  end

  it 'should have an division_id' do
    build(:pipeline, division_id: nil).should_not be_valid
  end
  it 'should have an employee_id' do
    build(:pipeline, employee_id: nil).should_not be_valid
  end

  it 'should have a reserved date' do
    build(:pipeline, reserved_date: nil).should_not be_valid
  end

  it 'should have a valid reserved date in present or past' do
    build(:pipeline, reserved_date: Date.today + 1).should_not be_valid
  end

  it 'should have default reserved date of today for new records' do
    Pipeline.new.reserved_date.should eql(Date.today)
  end
end
