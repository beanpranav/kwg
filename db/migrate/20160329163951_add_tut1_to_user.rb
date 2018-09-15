class AddTut1ToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tut0, :boolean, default: false
    add_column :users, :tut1, :boolean, default: false
    add_column :users, :tut2, :boolean, default: false
    add_column :users, :tut3, :boolean, default: false
  end
end
