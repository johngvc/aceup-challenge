require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Api::V1::Coaching::SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    travel_to Time.zone.local(2024, 4, 12, 1, 49, 0)
  end

  after { travel_back }

  describe 'POST #create' do
    let!(:coachee_user_id) { create(:role).user_id }
    let!(:coach_user_id) { create(:role, :coach).user_id }
    let(:session_params) do
      { coach_user_id: coach_user_id, coachee_user_id: coachee_user_id, start_time: 1.day.from_now, duration: 60 }
    end

    context 'when ok' do
      it 'returns 201' do
        post :create, params: { session_info: session_params }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'when missing params' do
      it 'returns 400' do
        post :create, params: { session_info: {} }, as: :json
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when scheduling error' do
      let(:error) { SessionScheduling::SchedulingError }

      before do
        allow(SessionScheduling).to receive(:schedule!).and_raise(error)
      end

      it 'returns 422' do
        post :create, params: { session_info: session_params }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
