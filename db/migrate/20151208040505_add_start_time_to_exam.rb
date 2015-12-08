class AddStartTimeToExam < ActiveRecord::Migration
  def change
    add_column :exams, :start_time, :timestamp
  end
end
