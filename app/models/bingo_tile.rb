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
end
