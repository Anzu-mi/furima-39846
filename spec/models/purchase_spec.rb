require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id )
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'bulding_name意外の項目に入力があれば登録できる' do
        expect(@purchase).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'post_codeが空では購入できない' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeはハイフン(-)がないと購入できない' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは全角数字だと購入できない' do
        @purchase.post_code = '１２３４５６７'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは6桁以下だと購入できない' do
        @purchase.post_code = '123456'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは8桁以上だと購入できない' do
        @purchase.post_code = '12345678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefucture_idが1だと購入できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @purchase.municipalities = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空だと購入できない' do
        @purchase.street_address = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @purchase.telephone = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下だと購入できない' do
        @purchase.telephone = "090111122"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Telephone is too short (minimum is 10 characters)")
      end
      it 'telephoneが12桁以上だと購入できない' do
        @purchase.telephone = "090111122222"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
      end
      it 'telephoneが全角数字だと購入できない' do
        @purchase.telephone = "０９０１１１１２２２２"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Telephone is not a number")
      end
      it 'telephoneは-を入れると購入できない' do
        @purchase.telephone = "090-1111-2222"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Telephone is not a number")
      end
      it 'tokenが空だと購入できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
