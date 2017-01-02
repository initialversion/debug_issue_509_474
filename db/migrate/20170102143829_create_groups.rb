class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :school
      t.string :industry
      t.boolean :open_or_closed
      t.boolean :hidden_or_public
      t.string :password

      t.timestamps

    end
  end
end
