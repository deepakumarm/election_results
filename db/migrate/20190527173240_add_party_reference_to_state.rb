class AddPartyReferenceToState < ActiveRecord::Migration[5.2]
  def change
    add_reference :states, :party, foreign_key: true
  end
end
