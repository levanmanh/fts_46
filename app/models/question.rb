class Question < ActiveRecord::Base
  enum status: [:waitting, :accepted]
  enum question_type: [:single, :multiple, :text]

  has_many :options, dependent: :destroy
  has_many :sections
  has_many :exams, through: :sections
  belongs_to :user
  belongs_to :subject

  accepts_nested_attributes_for :options,
    reject_if: proc{|attributes| attributes["content"].blank?},
    allow_destroy: true
end
