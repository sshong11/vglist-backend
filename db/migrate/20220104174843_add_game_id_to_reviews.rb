class AddGameIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :game_id, :integer
  end
end
