require 'rails_helper'
  describe User do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @furima_address = FactoryBot.build(:furima_address, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end
  describe '商品購入' do
    context '商品が購入できるとき' do
      it "正しい値が存在すれば購入できる" do
        expect(@furima_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @furima_address.postal_code = ''
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @furima_address.postal_code = '1234567'
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'regional_original_delivery_id を選択していないと保存できないこと' do
        @furima_address.regional_original_delivery_id = 0
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("Regional original delivery can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @furima_address.city = ''
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @furima_address.house_number = ''
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'building_nameは空でも保存できること' do
        @furima_address.building_name = '旭川市ハイツ'
        expect(@furima_address).to be_valid
      end
      it 'userが紐付いていないと保存できないこと' do
        @furima_address.user_id = nil
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @furima_address.item_id = nil
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'phone_numberが10か11桁でないと保存できないこと' do
        @furima_address.phone_number = '090123412345'
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @furima_address.token = nil
        @furima_address.valid?
        expect(@furima_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end