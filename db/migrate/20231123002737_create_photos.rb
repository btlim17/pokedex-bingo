class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.integer :animal_id
      t.string :url
      t.string :caption
      t.string :photo_type

      t.timestamps
    end
  end
end
