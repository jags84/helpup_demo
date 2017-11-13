FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name Faker::Name.first_name
    last_names Faker::Name.last_name 
    avatar Faker::Avatar.image
    password "123456"
    password_confirmation "123456"
  end
end
