require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品が出品できるとき' do
        it "正しい値が存在すれば出品できる" do
          expect(@item).to be_valid
        end
      end

      context '商品が出品できないとき' do
        it "商品画像がないとき" do
          @item.image = ''
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が無いとき" do
          @item.product = ''
          @item.product = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product can't be blank")
        end
        it "商品の説明が無いとき" do
          @item.product_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end
        it "カテゴリーの情報が無いとき" do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態についての情報が無いとき" do
          @item.product_state_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Product state must be other than 1")
        end
        it "配送料の負担についての情報が無いとき" do
          @item.delivery_charge_burden_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge burden must be other than 1")
        end
        it "発送元の地域についての情報が無いとき" do
          @item.regional_original_delivery_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Regional original delivery must be other than 1")
        end
        it "発送までの日数についての情報が無いとき" do
          @item.days_up_to_delivery_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Days up to delivery must be other than 1")
        end
        it "販売価格についての情報が無いとき" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "販売価格が、¥300~¥9,999,999の間で無い時" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "販売価格が半角数字で無い時" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      end
    end
  end
end