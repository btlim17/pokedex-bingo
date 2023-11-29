class CreateBingoTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :bingo_tiles do |t|
      t.integer :animal_id
      t.integer :bingo_board_id
      t.integer :position
      t.boolean :solved

      t.timestamps
    end
  end
end
