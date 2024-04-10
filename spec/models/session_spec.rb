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
  pending "add some examples to (or delete) #{__FILE__}"
end