class Question < ActiveRecord::Base
  has_many :options
  has_many :sections
  has_many :exams, through: :sections
  belongs_to :user
  belongs_to :subject
end
