class CreateBingoBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :bingo_boards do |t|
      t.integer :user_id
      t.integer :park_id

      t.timestamps
    end
  end
end
