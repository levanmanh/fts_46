class AddColumnResultToSections < ActiveRecord::Migration
  def change
    add_column :sections, :result, :boolean, default: false
  end
end
