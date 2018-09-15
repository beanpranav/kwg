class AddStudyIdToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :study_id, :integer
    add_index :games, :study_id
  end
end
