class AddColumnToCandidate < ActiveRecord::Migration[5.2]
  def change
  	add_column :candidates, :no_of_votes ,:integer
  end
end
