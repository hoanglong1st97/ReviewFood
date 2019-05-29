class AddAttachmentFoodImgToFoods < ActiveRecord::Migration[5.2]
  def self.up
    change_table :foods do |t|
      t.attachment :food_img
    end
  end

  def self.down
    remove_attachment :foods, :food_img
  end
end
