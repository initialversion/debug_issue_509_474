class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.string :follow_up_type
      t.integer :touchpoint_id
      t.integer :user_id
      t.integer :firm_id
      t.integer :contact_id
      t.string :notes

      t.timestamps

    end
  end
end
