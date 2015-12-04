class Subject < ActiveRecord::Base
  resourcify
  has_many :questions
  has_many :exams
end
