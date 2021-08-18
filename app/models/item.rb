class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  has_many :likes, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :image
    validates :selling_price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :days_to_ship_id
  end
  validates :category_id, inclusion: { in: [1,2,3,4,5,6,7,8,9,10] }
end
