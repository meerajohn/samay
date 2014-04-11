FactoryGirl.define do
  factory :timesheet do
    project_id 1
    division_id 1
    employee_id 1
    entry_date '2014-03-26'
    entry_period 'Morning'
    status 'completed'
    activity 'Designing'
    hours '4.00'
    notes 'This is a test timesheet record'
    created_by 1
    updated_by 1
  end
end
