class SessionScheduling
  def self.schedule!(coach_user, coachee_user, start_time, duration)
    validate_session_creation(coach_user, coachee_user, start_time)

    coach = coach_user.coach
    coachee = coachee_user.coachee

    coach_available = check_party_availability(coach, start_time, duration)
    coachee_available = check_party_availability(coachee, start_time, duration)

    parties_available = [coach_available, coachee_available].all? { |value| value == true }

    raise 'One or more Parties are not available for scheduling' unless parties_available

    Session.create!(coach: coach, coachee: coachee, start_time: start_time, duration: duration)
  end

  def self.check_party_availability(party, start_time, duration)
    end_time = start_time + duration.minutes

    sessions_on_queried_date = party.sessions.sessions_within_timeframe(start_time, end_time)

    time_overlap = sessions_on_queried_date.any?

    return false if time_overlap

    true
  end

  def self.validate_session_creation(coach_user, coachee_user, start_time)
    raise 'coach_user provided is not a Coach' unless coach_user.is(Coach)

    raise 'coachee_user provided is not a Coachee' unless coachee_user.is(Coachee)

    raise 'coach_user and coachee_user must be different' if coach_user == coachee_user

    raise 'Start time is in the past' if start_time < DateTime.now
  end
end
