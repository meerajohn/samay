FactoryGirl.define do
  factory :division do
    parent_id '01'
    code '1001'
    name 'Trainig'
    notes 'Trainig Process in departments'
    active true
    archived false
    created_by 1
    updated_by 1
  end
end
