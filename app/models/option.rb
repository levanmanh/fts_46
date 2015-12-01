class Option < ActiveRecord::Base
  has_many :answers
  has_many :sections, through: :answers
  belongs_to :question
end
