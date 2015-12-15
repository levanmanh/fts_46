require "faker"

FactoryGirl.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    password "12345678"
    password_confirmation "12345678"
    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
  end
end
