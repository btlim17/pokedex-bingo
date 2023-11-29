# == Schema Information
#
# Table name: wildlives
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  animal_id  :integer
#  park_id    :integer
#
class Wildlife < ApplicationRecord
end
