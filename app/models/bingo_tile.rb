# == Schema Information
#
# Table name: bingo_tiles
#
#  id             :integer          not null, primary key
#  position       :integer
#  solved         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  animal_id      :integer
#  bingo_board_id :integer
#
class BingoTile < ApplicationRecord
  belongs_to(:board, :class_name => "BingoBoard", :foreign_key => "bingo_board_id")
  belongs_to(:animal, :class_name=>"Animal", :foreign_key=>"animal_id")
end
