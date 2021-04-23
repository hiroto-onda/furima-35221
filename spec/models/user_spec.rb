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
          @user.password = "www111"
          @user.password_confirmation = "www111"
          expect(@user).to be_valid
        end
      end
  
      context '新規登録がうまくいかないとき' do
        it "nick_nameが空だと登録できない" do
          @user.nick_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nick name can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "family_nameが空だと登録できない" do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "first_nameが空だと登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "family_name_kanaが空だと登録できない" do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
        end
        it "first_name_kanaが空だと登録できない" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
        end
        it "dateが空だと登録できない" do
          @user.date = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Date can't be blank")
        end
        it "family_nameは半角だと登録できない" do
          @user.family_name = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end
        it "first_nameは半角だと登録できない" do
          @user.first_name = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it "family_name_kanaは半角だとと登録できない" do
          @user.family_name_kana = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it "family_name_kanaは全角かつカタカナでないと登録できない" do
          @user.family_name_kana = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it "first_name_kanaは半角だと登録できない
        " do
          @user.first_name_kana = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "first_name_kanaは全角かつカタカナでないと登録できない" do
          @user.first_name_kana = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "passwordは半角英語のみだと登録できない" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
        end
        it "passwordは半角数字のみだと登録できない" do
          @user.first_name_kana = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it "passwordは全角英数混合だと登録できない" do
          @user.first_name_kana = "AAA１１１"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
      end
    end
  end
end
