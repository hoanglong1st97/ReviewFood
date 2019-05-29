class Food < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reviews
    
    has_attached_file :food_img, :styles => { :food_index => "100x150>", :food_show => "325x475>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :food_img, :content_type => /\Aimage\/.*\Z/
end
