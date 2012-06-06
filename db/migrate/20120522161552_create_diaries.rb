class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.references :project

      t.timestamps
    end
    add_index :diaries, :project_id
  end
end
