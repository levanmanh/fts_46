class Exam < ActiveRecord::Base
  TIME_PER_EXAM = 1200
  QUESTION_PER_EXAM = 10

  enum status: [:opened, :testing, :saving, :checking, :checked]

  has_many :sections
  has_many :questions, through: :sections
  belongs_to :user
  belongs_to :subject

  before_create :create_section

  accepts_nested_attributes_for :questions
  def time_per_exam
    Exam::TIME_PER_EXAM / 60
  end

  def spent_time
    (Exam::TIME_PER_EXAM - self.duration)/60
  end
  private

  def create_section
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.number_question)
  end
end
