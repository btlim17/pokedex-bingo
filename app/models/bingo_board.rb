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
end
