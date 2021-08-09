class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :product_name
    validates :description
    validates :selling_price
  end
  validates :product_name, length: {maximum: 40}
  validates :description, length: { maximum: 1000 }

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :are_id
    validates
  end
end
