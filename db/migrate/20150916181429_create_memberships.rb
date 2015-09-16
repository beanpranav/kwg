class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :member_no

      t.timestamps
    end
  end
end
