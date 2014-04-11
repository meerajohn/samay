FactoryGirl.define do
  factory :client do
    code '1002'
    name 'Jane'
    contact '91-9896958663'
    photo 'images.jpg'
    remote_photo_url nil
    notes 'This is test client record'
    active true
    archived false
    created_by 1
    updated_by 1
  end
end
