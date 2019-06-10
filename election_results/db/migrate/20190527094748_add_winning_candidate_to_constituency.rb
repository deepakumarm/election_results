class AddWinningCandidateToConstituency < ActiveRecord::Migration[5.2]
  def change
    add_reference :constituencies, :winning_candidate, foreign_key: true
  end
end
