class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references :project
      t.references :participant
      t.string :role

      t.timestamps
    end
    add_index :collaborations, :project_id
    add_index :collaborations, :participant_id
  end
end
