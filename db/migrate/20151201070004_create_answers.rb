class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_correct
      t.integer :section_id
      t.integer :option_id
      t.timestamps null: false
    end
    add_index :answers, :option_id
    add_index :answers, :section_id
  end
end
