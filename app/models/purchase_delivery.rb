class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    VALID_PHONE_CODE_REGIX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number ,format: { with: VALID_PHONE_CODE_REGIX }
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }


  def save
    purchase =  Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, phone_number: phone_number, municipality: municipality, address: address, building_name: building_name, prefecture_id: prefecture_id, purchase_id: purchase.id )
  end
end