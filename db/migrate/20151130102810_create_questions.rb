class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :question_type
      t.string :content
      t.integer :status, default: Question.statuses[:accepted]
      t.timestamps null: false
    end
    add_index :questions, :subject_id
    add_index :questions, :user_id
  end
end
