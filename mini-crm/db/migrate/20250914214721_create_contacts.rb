class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company
      t.text :tags
      t.date :next_follow_up_date

      t.timestamps
    end
  end
end
