class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :status, default: Exam.statuses[:opened]
      t.integer :duration, default: Exam::TIME_PER_EXAM
      t.integer :number_question, default: Exam::QUESTION_PER_EXAM
      t.integer :spent_time, default: 0
      t.integer :started_at, default: 0
      t.timestamps null: false
    end
    add_index :exams, :subject_id
    add_index :exams, :user_id
  end
end
