class Exam < ActiveRecord::Base
  has_many :sections
  has_many :questions, through: :sections
  belongs_to :user
  belongs_to :subject
end
