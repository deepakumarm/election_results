class AddNoOfConstituenciesToParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :no_of_constituencies, :integer
  end
end
