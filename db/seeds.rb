Subject.create!(name:  "PHP and MySQL")
Subject.create!(name:  "Git")
Subject.create!(name:  "Ruby On Rails")
Subject.create!(name:  "Android")
Subject.create!(name:  "Java")
User.create!(email: "admin@gmail.com",
              encrypted_password: "admin1234",
              password: "admin1234")

50.times do |n|

  content  = Faker::Lorem.sentence(3, false, 4)
  subject_id = ((n % 5).ceil + 1)

  Question.create!(content:  content,
      user_id: 1,
      subject_id: subject_id,
      status: 1,
      question_type: 0)

  3.times do |o|
    content  = Faker::Lorem.sentence(3, false, 4)
    Option.create!(content:  content,
        question_id: (n+1) ,
        is_correct: false)
  end

  Option.create!(content:  content,
        question_id: (n+1) ,
        is_correct: true)

end

50.times do |n|

  content  = Faker::Lorem.sentence(3, false, 4)
  subject_id = ((n % 5).ceil + 1)

  Question.create!(content:  content,
      user_id: 1,
      subject_id: subject_id,
      status: 1,
      question_type: 1)

  4.times do |o|
    content  = Faker::Lorem.sentence(3, false, 4)
    Option.create!(content:  content,
        question_id: (n+51) ,
        is_correct: [true, false].sample)
  end

end

50.times do |n|

  content  = Faker::Lorem.sentence(3, false, 4)
  subject_id = ((n % 5).ceil + 1)

  Question.create!(content:  content,
      user_id: 1,
      subject_id: subject_id,
      status: 1,
      question_type: 2)

  Option.create!(content:  content,
        question_id: (n+101) ,
        is_correct: true)
end
