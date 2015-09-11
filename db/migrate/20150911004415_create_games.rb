class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :game_type
      t.integer :game_length
      t.integer :game_status
      t.boolean :access_treatement

      t.timestamps
    end
  end
end
