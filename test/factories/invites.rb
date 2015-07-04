FactoryGirl.define do
  factory :invite do
    email { |n| "invitemail#{n}@mail.com" }
    user_id 1
  end
end
