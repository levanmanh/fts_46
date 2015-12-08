class Exam < ActiveRecord::Base
  TIME_PER_EXAM = 1200
  QUESTION_PER_EXAM = 10

  enum status: [:opened, :testing, :saved, :checking, :checked]

  has_many :sections
  has_many :questions, through: :sections
  belongs_to :user
  belongs_to :subject

  before_create :create_section

  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :sections
  def time_per_exam
    Exam::TIME_PER_EXAM / 60
  end

  def time_remaining
    self.duration - self.spent_time
  end

  def change_status_when_test
    if self.opened? ||self.saved?
      self.status = :testing
      self.started_at = Time.zone.now.to_i
      self.recalculate_time
      self.save
    end
  end

  def recalculate_time
    self.spent_time += Time.zone.now.to_i - self.started_at
  end

  private

  def create_section
    self.questions << self.subject.questions.order("RANDOM()")
      .limit(self.number_question)
  end
end
