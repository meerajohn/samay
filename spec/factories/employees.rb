FactoryGirl.define do
  factory :employee do
    department_id 1
    code 'E10001'
    name 'John Doe'
    designation 'Manager'
    join_date '2014-03-26'
    user_id 1
    manager_id 1
    status 'active'
    photo 'employee.jpg'
    notes 'This is a test Employee record'
    active true
    archived false
    created_by 1
    updated_by 1
  end
end
