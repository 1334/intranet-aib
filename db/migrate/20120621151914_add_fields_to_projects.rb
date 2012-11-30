class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status, :string
    add_column :projects, :commission, :string
    add_column :projects, :address, :string
    add_column :projects, :city, :string
    add_column :projects, :state, :string
    add_column :projects, :country, :string
    add_column :projects, :start_year, :string
    add_column :projects, :end_year, :string
    add_column :projects, :gfa, :decimal
    add_column :projects, :exterior_area, :decimal
    add_column :projects, :budget, :decimal
  end
end
