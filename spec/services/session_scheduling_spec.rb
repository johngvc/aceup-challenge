require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe SessionScheduling, type: :service do
  describe '.schedule!' do
    subject { described_class.schedule!(coach_user, coachee_user, start_time, duration) }

    context 'when parties are available' do
      let(:coach_user) { create(:role, :coach).user }
      let(:coachee_user) { create(:role).user }
      let(:start_time) { 1.day.from_now }
      let(:duration) { 30 }
      let(:session) do
        build(:session, coach: coach_user.coach, coachee: coachee_user.coachee, start_time: start_time,
                        duration: duration)
      end

      it 'returns created session' do
        expect(subject).to be_a(Session)
      end
    end

    context 'when parties are not available' do
      let(:coach_user) { create(:role, :coach).user }
      let(:coachee_user) { create(:role).user }
      let(:start_time) { 1.day.from_now }
      let(:duration) { 30 }
      let!(:session) do
        create(:session, coach: coach_user.coach, coachee: coachee_user.coachee, start_time: start_time,
                         duration: duration)
      end

      it 'raises error' do
        expect { subject }.to raise_error('One or more Parties are not available for scheduling')
      end
    end
  end

  describe '.check_party_availability' do
    subject { described_class.check_party_availability(party, start_time, duration) }

    context 'when party is available' do
      let(:party) { create(:coach) }
      let(:start_time) { 1.day.from_now }
      let(:duration) { 30 }

      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'when party is not available' do
      let(:coach) { create(:coach) }
      let(:party) { create(:coachee) }
      let(:start_time) { 1.day.from_now }
      let(:duration) { 30 }
      let!(:session) { create(:session, coach: coach, coachee: party, start_time: start_time, duration: duration) }

      it 'returns false' do
        expect(subject).to be false
      end
    end
  end

  describe '.validate_session_creation' do
    subject { described_class.validate_session_creation(coach_user, coachee_user, start_time) }

    context 'when valid' do
      let(:coach_user) { create(:role, :coach).user }
      let(:coachee_user) { create(:role).user }
      let(:start_time) { 1.day.from_now }

      it 'does not raise errors' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when invalid' do
      context 'when coach_user is not a Coach' do
        let(:coach_user) { create(:role).user }
        let(:coachee_user) { create(:role).user }
        let(:start_time) { 1.day.from_now }

        it 'raises an error' do
          expect { subject }.to raise_error('coach_user provided is not a Coach')
        end
      end

      context 'when coachee_user is not a Coachee' do
        let(:coach_user) { create(:role, :coach).user }
        let(:coachee_user) { create(:role, :coach).user }
        let(:start_time) { 1.day.from_now }

        it 'raises an error' do
          expect { subject }.to raise_error('coachee_user provided is not a Coachee')
        end
      end

      context 'when coach_user and coachee_user are the same' do
        let(:coach_user) { create(:role, :coach).user }
        let(:coachee_user) { create(:role, user: coach_user).user }
        let(:start_time) { 1.day.from_now }

        it 'raises an error' do
          expect { subject }.to raise_error('coach_user and coachee_user must be different')
        end
      end

      context 'when start_time is in the past' do
        let(:coach_user) { create(:role, :coach).user }
        let(:coachee_user) { create(:role).user }
        let(:start_time) { 1.day.ago }

        it 'raises an error' do
          expect { subject }.to raise_error('Start time is in the past')
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
