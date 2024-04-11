module Api
  module V1
    module Coaching
      class SessionsController < ApplicationController
        include ExceptionHandler
        include ActAsApiRequest
        # include DeviseTokenAuth::Concerns::SetUserByToken

        # before_action :authenticate_user!

        def create # rubocop:disable Metrics/AbcSize
          session_info = params.require(:session_info)&.permit(:coach_user_id, :coachee_user_id, :start_time, :duration)

          return render json: 'All fields are required', status: :unprocessable_entity if session_info.value?(nil)

          coach_user = User.find(session_info[:coach_user_id])
          coachee_user = User.find(session_info[:coachee_user_id])
          start_time = DateTime.parse(session_info[:start_time])

          session = SessionScheduling.schedule!(coach_user, coachee_user, start_time,
                                                session_info[:duration])

          render json: session, status: :created
        rescue SessionScheduling::SchedulingError => e
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end
    end
  end
end
