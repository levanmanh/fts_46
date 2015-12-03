class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :status, default: Exam.statuses[:opened]
      t.integer :duration, default: 1800
      t.integer :number_question, default: 10
      t.timestamps null: false
    end
    add_index :exams, :subject_id
    add_index :exams, :user_id
  end
end
