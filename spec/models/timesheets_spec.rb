require 'spec_helper'

describe Timesheet do

  it 'should have a project' do
    build(:timesheet, project_id: nil).should_not be_valid
  end

  it 'should have an employee' do
    build(:timesheet, employee_id: nil).should_not be_valid
  end

  it 'should have a valid entry date' do
    build(:timesheet, entry_date: nil).should_not be_valid
  end

  it 'should have a entry period' do
    build(:timesheet, entry_period: nil).should_not be_valid
  end

  it 'should have a working hours' do
    build(:timesheet, hours: nil).should_not be_valid
  end

  it 'should default entry date to today for new records' do
    Timesheet.new.entry_date.should eql(Date.today)
  end

  it 'should not have entry date in future' do
    build(:timesheet, entry_date: Date.today + 1).should_not be_valid
  end
end
