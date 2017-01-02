class CreateTargetFirms < ActiveRecord::Migration
  def change
    create_table :target_firms do |t|
      t.integer :user_id
      t.integer :firm_id
      t.string :touch_goal

      t.timestamps

    end
  end
end
