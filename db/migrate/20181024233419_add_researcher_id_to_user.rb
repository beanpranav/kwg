class AddResearcherIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :researcher_id, :integer, null: true, index: true
    add_foreign_key :users, :users, column: :researcher_id
  end
end

