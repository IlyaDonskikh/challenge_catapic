FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :password do |n|
    "secretpwd#{n}"
  end
end
