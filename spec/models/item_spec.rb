require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it 'product_name, description, category_id, condition_id, burden_id, area_id, days_to_ship_id, selling_priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
      it 'product_nameが40文字以下なら登録できること' do
        @item.product_name = 'a' * 40
        expect(@item).to be_valid
      end
      it 'descriptionが1000文字以下なら登録できること' do
        @item.description = 'a' * 1000
        expect(@item).to be_valid
      end
      it 'selling_priceが300円以上なら登録できること' do
        @item.selling_price = 300
        expect(@item).to be_valid
      end
      it 'selling_priceが9,999,999円以下なら登録できること' do
        @item.selling_price = 9_999_999
        expect(@item).to be_valid
      end
      it 'selling_priceが半角数値なら登録できること' do
        @item.selling_price = 3000
        expect(@item).to be_valid
      end
      context '商品出品ができない時' do
        it 'product_nameが空では登録できないこと' do
          @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Product name can't be blank"
        end
        it 'descriptionが空では登録できないこと' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Description can't be blank"
        end
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end
        it 'category_idが1では登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it 'condtion_idが1では登録できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Condition can't be blank"
        end
        it 'burdenが1では登録できないこと' do
          @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Burden can't be blank"
        end
        it 'areaが1では登録できないこと' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Area can't be blank"
        end
        it 'days_to_ship_idが1では登録できないこと' do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Days to ship can't be blank"
        end
        it 'selling_priceが空では登録できないこと' do
          @item.selling_price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price can't be blank", 'Selling price is invalid',
                                                        'Selling price is not a number'
        end
        it 'product_nameが41文字以上だと登録できないこと' do
          @item.product_name = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include 'Product name is too long (maximum is 40 characters)'
        end
        it 'descriptionが1001文字以上だと登録できないこと' do
          @item.description = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include 'Description is too long (maximum is 1000 characters)'
        end
        it 'selling_priceが299円以下だと登録できないこと' do
          @item.selling_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include 'Selling price must be greater than or equal to 300'
        end
        it 'selling_priceが10,000,000円以上だと登録できないこと' do
          @item.selling_price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include 'Selling price must be less than or equal to 9999999'
        end
        it 'selling_priceが半角数値以外だと登録できなこと' do
          @item.selling_price = '３０００'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Selling price is not a number'
        end
        it 'selling_priceが半角英数時混合では登録出来ないこと' do
          @item.selling_price = 'a1000'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Selling price is not a number'
        end
        it 'selling_priceが半角英語だけでは登録できない' do
          @item.selling_price = 'aaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include 'Selling price is not a number'
        end
      end
    end
  end
end
