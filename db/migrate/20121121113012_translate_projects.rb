class TranslateProjects < ActiveRecord::Migration
  def self.up
    Project.create_translation_table!({
      :name => :string,
      :description => :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    Project.drop_translation_table! mnigrate_data: true
  end
end
