require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができるとき' do
      it '全ての項目入力があれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができないとき' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_commentが空では出品できない' do
        @item.item_comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item comment can't be blank")
      end
      it 'categoryはidに1が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'itemsituationはidに1が選択されている場合は出品できない' do
        @item.itemsituation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Itemsituation must be other than 1')
      end
      it 'burdenはidに1が選択されている場合は出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it 'prefectureはidに1が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'durationはidに1が選択されている場合は出品できない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Duration must be other than 1')
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは半角数字でないと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐づいていないと出品できない' do
        user = User.find_by(email: 'example@example.com')
        @item.user = user
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
