# == Schema Information
#
# Table name: coachees
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Coachee, type: :model do
  describe 'associations' do
    subject { build(:coachee) }

    it { is_expected.to have_one(:role) }
    it { is_expected.to have_many(:sessions) }
    it { is_expected.to have_one(:user) }
  end
end
