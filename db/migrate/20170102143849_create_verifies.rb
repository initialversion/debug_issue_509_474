class CreateVerifies < ActiveRecord::Migration
  def change
    create_table :verifies do |t|
      t.integer :user_id
      t.integer :recruiting_event_id

      t.timestamps

    end
  end
end
