class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.numeric :no_of_constituencies

      t.timestamps
    end
  end
end
