require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '購入が成功する場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入が失敗する場合' do
      it '郵便番号が空だと購入できない' do
        @purchase_address.zip_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.zip_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it '都道府県が選択されていないと購入できない' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @purchase_address.address_line = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address line can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @purchase_address.tell = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell can't be blank")
      end
      it '電話番号が10桁未満だと購入できない' do
        @purchase_address.tell = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tell must be 10 or 11 digits')
      end
      it '電話番号が12桁以上だと購入できない' do
        @purchase_address.tell = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tell must be 10 or 11 digits')
      end
      it '電話番号にハイフンが含まれていると購入できない' do
        @purchase_address.tell = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tell must be 10 or 11 digits')
      end
      it 'userが紐付いていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
