FactoryGirl.define do
  factory :project do
    division_id 1
    client_id 1
    code 'P10001'
    name 'Library Management'
    start_date '2014-03-25'
    end_date '2014-03-25'
    manager_id 1
    notes 'This is a test Project record'
    active true
    archived false
    created_by 1
    updated_by 1
  end
end
