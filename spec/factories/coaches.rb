# == Schema Information
#
# Table name: coaches
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :coach do
    trait :with_role do
      role { association :role }
    end
  end
end
