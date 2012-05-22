class AddIndexToProjects < ActiveRecord::Migration
  def change
    add_index :projects, :code
  end
end
