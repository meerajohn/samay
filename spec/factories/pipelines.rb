FactoryGirl.define do
  factory :pipeline do
    project_id 1
    division_id 1
    employee_id 1
    reserved_date '2014-03-26'
    status 'reserved'
    notes 'This is a test pipeline record'
    created_by 1
    updated_by 1
  end
end
