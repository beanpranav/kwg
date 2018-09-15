class AddUsersTotalToProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :users_total
    add_column :projects, :users_total, :integer, :array => true, default: [[0,0,0]]
  end
end