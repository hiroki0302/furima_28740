require 'rails_helper'

describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user_id = @user.id
    @item.image = fixture_file_upload('public/apple-touch-icon.png')
    @item.save
    @user_purchase = FactoryBot.build(:user_purchase)
    @user_purchase.user_id = @user.id
    @user_purchase.item_id = @item.id
  end


  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "token, post_code, ship_to_region_id, city,phone_number" do
        @user_purchase.building = ""
        expect(@user_purchase).to be_valid
      end

      it "token, post_code, ship_to_region_id, city, bulding, phone_number" do
        expect(@user_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenがないとき" do
        @user_purchase.token = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeがないとき' do
        @user_purchase.post_code = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it 'ship_to_region_idがないとき' do
        @user_purchase.ship_to_region_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Ship to region can't be blank")
      end
      it 'cityがないとき' do
        @user_purchase.city = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'blockがないとき' do
        @user_purchase.block = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberがないとき' do
        @user_purchase.phone_number = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number 半角数字で入力してください")
      end
      it '郵便番号にはハイフンがないとき' do
        @user_purchase.post_code = "1234567"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '電話番号にハイフンがある場合' do
        @user_purchase.phone_number = "090-1234-5678"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number 半角数字で入力してください")
      end
      it '電話番号が11桁以上のとき' do
        @user_purchase.phone_number = "090123456789"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number 半角数字で入力してください")
      end
      it 'useridが登録されていないとき' do
        @user_purchase.user_id = " "
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end
      it '電話番号が11桁以上のとき' do
        @user_purchase.item_id = " "
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

  
end