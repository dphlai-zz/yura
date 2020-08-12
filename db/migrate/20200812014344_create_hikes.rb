class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.text :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
