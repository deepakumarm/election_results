class AddColumnForVotersToConstituency < ActiveRecord::Migration[5.2]
  def change
  	add_column :constituencies,:no_of_voters,:integer
  end
end
