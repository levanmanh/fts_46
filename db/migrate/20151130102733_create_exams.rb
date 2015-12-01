class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :status
      t.time :duration
      t.integer :number_question
      t.timestamps null: false
    end
    add_index :exams, :subject_id
    add_index :exams, :user_id
  end
end
