class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer, default: 18
    add_column :users, :failed_attempt_count, :integer, default: 0

    add_column :players, :age, :integer, default: 18
    add_column :players, :failed_attempt_count, :integer, default: 0
  end
end
