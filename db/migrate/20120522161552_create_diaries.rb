class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.references :trackable, polymorphic: true

      t.timestamps
    end
    add_index :diaries, :trackable_id
  end
end
