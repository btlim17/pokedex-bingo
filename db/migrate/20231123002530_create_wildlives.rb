class CreateWildlives < ActiveRecord::Migration[7.0]
  def change
    create_table :wildlives do |t|
      t.integer :park_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
