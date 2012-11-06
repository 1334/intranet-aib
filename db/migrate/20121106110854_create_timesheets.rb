class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.references :user
      t.references :project
      t.date :date
      t.string :daily_hours
      t.string :total_hours

      t.timestamps
    end
    add_index :timesheets, [:user_id, :project_id, :date]
    add_index :timesheets, :user_id
    add_index :timesheets, :project_id
  end
end
