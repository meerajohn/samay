FactoryGirl.define do
  factory :department do
    code 'DP10001'
    name 'Marketing'
    kind 'Sales'
    manager_id 1
    notes 'This is a department'
    active true
    archived false
    created_by 1
    updated_by 1
  end
end
