FactoryBot.define do
  factory :purchase_delivery do
    postal_code        { '123-4567' }
    phone_number       { '01234567890' }
    municipality       { '東京都港区' }
    address            { '青山1-1-1' }
    building_name      { 'サンプルビル100' }
    prefecture_id      { 2 }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
