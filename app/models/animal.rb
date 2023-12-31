# == Schema Information
#
# Table name: animals
#
#  id                  :integer          not null, primary key
#  conservation_status :string
#  est_population      :integer
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Animal < ApplicationRecord
  has_many(:photos, :class_name => "Photo", :foreign_key=>"animal_id")
end
