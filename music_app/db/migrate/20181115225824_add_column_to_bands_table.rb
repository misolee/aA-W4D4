class AddColumnToBandsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :origin, :string
    add_column :bands, :genre, :string
    add_column :bands, :members, :string
    add_index :bands, :origin
    add_index :bands, :genre
    add_index :bands, :members
  end
end
