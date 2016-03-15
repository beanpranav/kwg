class AddConsentToUser < ActiveRecord::Migration
  def change
    add_column :users, :player_name, :string, default: ""
    add_column :users, :player_screenname, :string, default: ""
    add_column :users, :gender, :string, default: ""
    add_column :users, :valid_age, :boolean, default: false
    add_column :users, :valid_read, :boolean, default: false
    add_column :users, :valid_consent, :boolean, default: false

    add_column :players, :player_name, :string, default: ""
    add_column :players, :player_screenname, :string, default: ""
    add_column :players, :gender, :string, default: ""
    add_column :players, :valid_age, :boolean, default: false
    add_column :players, :valid_read, :boolean, default: false
    add_column :players, :valid_consent, :boolean, default: false
  end
end
