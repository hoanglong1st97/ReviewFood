class AddCategoryIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :category_id, :integer
  end
end
