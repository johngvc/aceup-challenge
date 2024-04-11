# == Schema Information
#
# Table name: coaches
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Coach < ApplicationRecord
  has_one :role, as: :roleable
  def user
    role.user
  end
end
