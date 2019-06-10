class CreateConstituencies < ActiveRecord::Migration[5.2]
  def change
    create_table :constituencies do |t|
      t.string :name
      t.numeric :no_of_candidates
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
