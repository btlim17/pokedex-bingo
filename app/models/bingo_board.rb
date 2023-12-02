# == Schema Information
#
# Table name: bingo_boards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  park_id    :integer
#  user_id    :integer
#
class BingoBoard < ApplicationRecord
  has_many(:tiles, :class_name => "BingoTile", :foreign_key => "bingo_board_id")
  belongs_to(:park, :class_name => "Park", :foreign_key => "park_id")
  belongs_to(:user, :class_name =>"User", :foreign_key => "user_id")
end
