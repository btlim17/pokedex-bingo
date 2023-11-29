class CreateConservationCta < ActiveRecord::Migration[7.0]
  def change
    create_table :conservation_cta do |t|
      t.string :name
      t.integer :animal_id
      t.string :url

      t.timestamps
    end
  end
end
