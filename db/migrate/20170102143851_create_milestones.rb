class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.date :campus_recruiting_start
      t.date :closed_events_start
      t.date :bankweek
      t.date :interviews_start

      t.timestamps

    end
  end
end
