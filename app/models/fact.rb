# == Schema Information
#
# Table name: facts
#
#  id         :integer          not null, primary key
#  fun_fact   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  animal_id  :integer
#
class Fact < ApplicationRecord
end
