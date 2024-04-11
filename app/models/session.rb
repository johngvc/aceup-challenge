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
class Session < ApplicationRecord
  belongs_to :coach
  belongs_to :coachee

  scope :sessions_within_timeframe, lambda { |start_date, end_date|
                                      where('(start_time BETWEEN ? AND ?)', start_date,
                                            end_date).or(where("((start_time + (duration * interval '1 minute' )) BETWEEN ? AND ?)", start_date,
                                                               end_date))
                                    }
  def end_time
    start_time + duration.minutes
  end

  def timeframe
    start_time..(start_time + duration.minutes)
  end
end
