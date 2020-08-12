class AddHikeIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :hike_id, :integer
  end
end
