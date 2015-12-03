class Exam < ActiveRecord::Base
  enum status: [:opened, :testing, :saving, :checking, :checked]

  has_many :sections
  has_many :questions, through: :sections
  belongs_to :user
  belongs_to :subject

  before_create :create_section

  private

  def create_section
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.number_question)
  end
end
