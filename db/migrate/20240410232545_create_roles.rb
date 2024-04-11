class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :roleable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
