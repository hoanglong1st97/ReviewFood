class AddFoodIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :food_id, :integer
  end
end
