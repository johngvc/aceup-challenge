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
  has_one :user, through: :role
  has_many :sessions
end
