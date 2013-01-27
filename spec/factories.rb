FactoryGirl.define do
  factory :user do
    name     "Hanson Wu"
    email    "hanson@clio.com"
    password "testing123"
    password_confirmation "testing123"
  end

  factory :status_change do
    status "Lunch"    
    user
  end
end