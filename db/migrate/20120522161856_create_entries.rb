class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :diary
      t.date :date
      t.string :entry_type
      t.string :responsible
      t.string :subject
      t.text :comments

      t.timestamps
    end
    add_index :entries, :diary_id
  end
end
