FactoryGirl.define do
  factory :album do
    user
    title "Album Title"
    private false
  end
end
