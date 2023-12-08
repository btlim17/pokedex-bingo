# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  caption    :string
#  photo_type :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  animal_id  :integer
#
class Photo < ApplicationRecord
  belongs_to(:animal, :class_name=>"Animal", :foreign_key=>"animal_id")
end
