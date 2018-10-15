class AddIndexToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_index :favorites, %i[feed_id user_id], unique: true
  end
end
