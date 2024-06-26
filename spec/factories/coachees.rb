# == Schema Information
#
# Table name: coachees
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :coachee do
    trait :with_role do
      role { association :role }
    end
  end
end
