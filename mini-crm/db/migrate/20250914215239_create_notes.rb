class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.boolean :pinned
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
