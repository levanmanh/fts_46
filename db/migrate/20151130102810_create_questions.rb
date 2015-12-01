class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :type
      t.string :content
      t.integer :status
      t.timestamps null: false
    end
    add_index :questions, :subject_id
    add_index :questions, :user_id
  end
end
