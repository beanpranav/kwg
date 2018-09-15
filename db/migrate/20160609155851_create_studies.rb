class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.string :title
      t.boolean :completed
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
