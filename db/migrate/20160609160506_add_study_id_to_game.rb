class AddStudyIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :study_id, :integer
    add_index :games, :study_id
  end
end
