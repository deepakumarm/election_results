class NewMigrationCode < ActiveRecord::Migration[5.2]
  def change
  	remove_column :constituencies,:candidate_id
  end
end
