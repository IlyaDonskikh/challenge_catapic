FactoryGirl.define do
  factory :invite do
    email { generate(:email) }
  end
end
