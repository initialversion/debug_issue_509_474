class CreateRecruitingEvents < ActiveRecord::Migration
  def change
    create_table :recruiting_events do |t|
      t.string :name
      t.string :location
      t.string :address
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :closed
      t.integer :firm_id

      t.timestamps

    end
  end
end
