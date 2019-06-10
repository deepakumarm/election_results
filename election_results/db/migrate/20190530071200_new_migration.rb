class NewMigration < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :constituencies,:candidates
  end
end
