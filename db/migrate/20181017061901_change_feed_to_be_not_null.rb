class ChangeFeedToBeNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :feeds, :image, null: false
  end
end
