FactoryGirl.define do
  factory :user do
    email { |n| "mail#{n}@mail.com" }
    password { |n| "verysecretpwd#{n}" }

    trait :confirmed do
      confirmed_at Time.now
    end

    factory :user_with_invites do
      transient do
        invites_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:invite, evaluator.invites_count, user: user)
      end
    end
  end
end
