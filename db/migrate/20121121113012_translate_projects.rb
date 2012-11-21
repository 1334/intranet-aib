class TranslateProjects < ActiveRecord::Migration
  def self.up
    Project.create_translation_table!({
      :name => :string,
      :description => :text

    })
  end

  def self.down
    Project.drop_translation_table! 
  end
end
