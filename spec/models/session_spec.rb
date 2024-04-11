# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  duration   :bigint
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :bigint           not null, indexed
#  coachee_id :bigint           not null, indexed
#
# Indexes
#
#  index_sessions_on_coach_id    (coach_id)
#  index_sessions_on_coachee_id  (coachee_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => coaches.id)
#  fk_rails_...  (coachee_id => coachees.id)
#
require 'rails_helper'

RSpec.describe Session, type: :model do
  subject { session }

  let(:session) { build(:session) }

  describe 'associations' do
    it { is_expected.to belong_to(:coach) }
    it { is_expected.to belong_to(:coachee) }
  end

  describe 'timeframe' do
    subject { session.timeframe }

    it 'returns the correct timeframe' do
      expect(session.timeframe).to eq(session.start_time..(session.start_time + session.duration.minutes))
    end
  end

  describe 'end_time' do
    subject { session.end_time }

    it 'returns the correct end time' do
      expect(session.end_time).to eq(session.start_time + session.duration.minutes)
    end
  end
end
