class AddColumnToCandidates < ActiveRecord::Migration[5.2]
  def change
  	add_column :candidates, :name ,:string
  end
end
