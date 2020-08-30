require 'rails_helper'

describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user_id = @user.id
    @item.image = fixture_file_upload('public/apple-touch-icon.png')
  end

  describe '商品出品' do
    context '出品登録がうまくいくとき' do
      it "image,name,description,category_id,state_id,burden_of_delivery_charge_id,ship_to_region_id,day_to_ship_id,price,user_id" do
        expect(@item).to be_valid
      end
    end
  end

  context '出品登録がうまくいかないとき' do
    it "userがログインしていない時" do
      @item.user_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist", "User can't be blank")
    end

    it "画像が入力されていない時" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が入力されていない時" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "カテゴリー情報が入力されていない時" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "商品の状態についての情報が入力されていない時" do
      @item.category_id =""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "配送料の情報が入力されていない時" do
      @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end

    it "発送元の地域情報が入力されていない時" do
      @item.burden_of_delivery_charge_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden of delivery charge can't be blank")
    end

    it "発送までの日数情報が入力されていない時" do
      @item.ship_to_region_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship to region can't be blank")
    end

    it "価格についての情報が入力されていない時" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が¥300未満の時" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の間の金額にしてください")
    end

    it "価格が¥9,999,999以上の時" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の間の金額にしてください")
    end

    it "価格が半角数字でない時" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end

  end


end
