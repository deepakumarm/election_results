class AddColumnToShortLink < ActiveRecord::Migration[5.2]
  def change
    add_column :short_links, :value, :integer
  end
end
