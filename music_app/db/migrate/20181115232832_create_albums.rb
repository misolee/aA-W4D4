class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year
      t.integer :band_id
      t.boolean :live, default: true
      t.timestamps
    end
    add_index :albums, :band_id
  end
end
