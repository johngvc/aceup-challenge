class AddRoleAbleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :roleable, polymorphic: true, null: false
  end
end
