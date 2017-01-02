class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :firm_id
      t.string :group
      t.string :division
      t.string :title
      t.string :photo
      t.string :business_card
      t.string :email
      t.string :phone_number

      t.timestamps

    end
  end
end
