# == Schema Information
#
# Table name: conservation_cta
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  animal_id  :integer
#
class ConservationCtum < ApplicationRecord
end
