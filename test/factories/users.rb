FactoryGirl.define do
  factory :user do
    email { |n| "mail#{n}@mail.com" }
    password { |n| "verysecretpwd#{n}" }

    trait :confirmed do
      confirmed_at Time.now
    end
  end
end
