require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'お気に入り機能の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @like = FactoryBot.build(:like, user_id: user.id, item_id: item.id)
    end
    context '内容に問題がない場合' do
      it '全ての値が存在すれば保存できること' do
        expect(@like).to be_valid
      end
      it '自分と他のユーザーが同じ商品に対していいねできること' do
        @like.save
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        another_user = FactoryBot.build(:like, user_id: user.id, item_id: item.id)
        another_user.item_id = @like.item_id
        expect(another_user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空だと保存できないこと' do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("User must exist")
      end
      it 'item_idが空だと保存できないこと' do
        @like.item_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
