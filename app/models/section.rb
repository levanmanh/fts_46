class Section < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  has_many :answers
  has_many :options, through: :question
end
