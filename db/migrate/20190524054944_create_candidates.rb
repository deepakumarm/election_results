class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.references :constituency, foreign_key: true
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
