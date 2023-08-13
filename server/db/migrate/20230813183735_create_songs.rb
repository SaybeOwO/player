class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :link
      t.integer :uid

      t.timestamps
    end
  end
end
