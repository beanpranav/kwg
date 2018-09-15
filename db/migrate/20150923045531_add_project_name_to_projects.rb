class AddProjectNameToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_name, :string
    remove_column :team_memberships, :member_no
    add_column :players, :member_no, :integer
  end
end
