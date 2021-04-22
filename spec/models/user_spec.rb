require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nick_nameとemail、passwordとpassword_confirmationとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとdateが存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上であれば登録できる" do
          @user.password = "000000"
          @user.password_confirmation = "000000"
          expect(@user).to be_valid
        end
      end
  
      context '新規登録がうまくいかないとき' do
        it "nick_nameが空だと登録できない" do
        end
        it "emailが空では登録できない" do
        end
        it "重複したemailが存在する場合登録できない" do
        end
        it "passwordが空では登録できない" do
        end
        it "passwordが5文字以下であれば登録できない" do
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
        end
        it "family_nameが空だと登録できない" do
        end
        it "first_nameが空だと登録できない" do
        end
        it "family_name_kanaが空だと登録できない" do
        end
        it "first_name_kanaが空だと登録できない" do
        end
        it "dateが空だと登録できない" do
        end
      end
    end
  end
end
