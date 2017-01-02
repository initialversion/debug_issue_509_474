class CreateTouchpoints < ActiveRecord::Migration
  def change
    create_table :touchpoints do |t|
      t.date :date
      t.time :time
      t.integer :user_id
      t.integer :contact_id
      t.integer :firm_id
      t.string :description
      t.string :location
      t.string :notes

      t.timestamps

    end
  end
end
