# == Schema Information
#
# Table name: roles
#
#  id            :bigint           not null, primary key
#  roleable_type :string           not null, indexed => [roleable_id]
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  roleable_id   :bigint           not null, indexed => [roleable_type]
#  user_id       :bigint           not null, indexed
#
# Indexes
#
#  index_roles_on_roleable  (roleable_type,roleable_id)
#  index_roles_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    subject { build(:role) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:roleable) }
  end
end
