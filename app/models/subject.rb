class Subject < ActiveRecord::Base
  has_many :questions
  has_many :exams
end
