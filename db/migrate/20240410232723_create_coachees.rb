class CreateCoachees < ActiveRecord::Migration[6.1]
  def change
    create_table :coachees do |t|

      t.timestamps
    end
  end
end
