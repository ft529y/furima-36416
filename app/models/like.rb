class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :item_id, uniqueness: { scope: :user_id }
    validates :item_id
  end
end
