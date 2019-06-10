class AddforeignKeyToConstituency < ActiveRecord::Migration[5.2]
  def change
  	add_reference :constituencies,:candidates,foreign_key: true;
  end
end
