# == Schema Information
#
# Table name: coachees
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Coachee < ApplicationRecord
  has_one :role, as: :roleable
  has_one :user, through: :role
  has_many :sessions
end
