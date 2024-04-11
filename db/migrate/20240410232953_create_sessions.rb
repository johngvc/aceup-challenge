class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :coachee, null: false, foreign_key: true
      t.datetime :start_time
      t.bigint :duration

      t.timestamps
    end
  end
end
