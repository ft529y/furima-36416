class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :days_to_ship

  validates :product_name, length: {maximum: 40}
  validates :description, length: { maximum: 1000 }
  
  with_options presence:true, format: { with: /\A[0-9]+\z/ } do
    validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 }
  end

  with_options presence: true do
    validates :product_name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :days_to_ship_id
  end

end
