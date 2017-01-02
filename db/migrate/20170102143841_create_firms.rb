class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.string :industry
      t.string :size
      t.string :process_type

      t.timestamps

    end
  end
end
