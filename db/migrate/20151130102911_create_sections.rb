class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :question_id
      t.integer :exam_id
      t.string :answer, default: ""
      t.timestamps null: false
    end
    add_index :sections, :question_id
    add_index :sections, :exam_id
  end
end
