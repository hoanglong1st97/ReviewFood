class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :author
      t.text :desciption
      t.string :address
      t.string :time
      t.numeric :price
      t.numeric :sale
      t.timestamps
    end
  end
end
