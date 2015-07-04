FactoryGirl.define do
  factory :user do
    email { |n| "mail{n}@mail.com" }
    password { |n| "verysecretpwd{n}" }
  end
end
