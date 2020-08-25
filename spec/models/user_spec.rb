require 'rails_helper'

# RSpec.describe User, type: :model do
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録ができない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが無ければ登録ができない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailで@が無ければ登録ができない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが6文字以下であれば登録できない" do
        @user.password = "01234"
        @user.password_confirmation = "01234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字でなければ登録できない" do
        @user.password = "012345"
        @user.password_confirmation = "012345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて6文字以上で設定してください")
      end
      it "password_confirmationがpasswordと同じでなければ登録できない" do
        @user.password = "a12345"
        @user.password_confirmation = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameがなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameがなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが全角（漢字、ひらがな、カナ）でなければ登録できない" do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_nameが全角（漢字、ひらがな、カナ）でなければ登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_name_kanaが全角カナでなければ登録できない" do
        @user.last_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Last name kana 全角カナを使用してください")
      end
      it "first_name_kanaが全角カナでなければ登録できない" do
        @user.first_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name kana 全角カナを使用してください")
      end
      it "birthdayがなければ登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
