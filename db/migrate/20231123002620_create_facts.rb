class CreateFacts < ActiveRecord::Migration[7.0]
  def change
    create_table :facts do |t|
      t.integer :animal_id
      t.string :fun_fact

      t.timestamps
    end
  end
end
