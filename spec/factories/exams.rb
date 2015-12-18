FactoryGirl.define do
  factory :exam do
    subject{FactoryGirl.create :subject}
    user{FactoryGirl.create :user}
    status :checking
  end
end
