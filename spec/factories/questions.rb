FactoryGirl.define do
  factory :question_single, class: Question do
    content{Faker::Lorem.word}
    user {FactoryGirl.create :user}
    subject {FactoryGirl.create :subject}
    question_type :single
    status :waitting
  end
  factory :question_multi, class: Question do
    content{Faker::Lorem.word}
    user {FactoryGirl.create :user}
    subject {FactoryGirl.create :subject}
    question_type :multiple
    status :waitting
  end
  factory :question_text, class: Question do
    content{Faker::Lorem.word}
    user {FactoryGirl.create :user}
    subject {FactoryGirl.create :subject}
    question_type :text
    status :waitting
  end
end
