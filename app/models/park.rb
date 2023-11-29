# == Schema Information
#
# Table name: parks
#
#  id         :integer          not null, primary key
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Park < ApplicationRecord
end
