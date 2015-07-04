FactoryGirl.define do
  factory :invite do
    email { |n| "invitemail#{n}@mail.com" }
  end
end
