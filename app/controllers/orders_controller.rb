class OrdersController < ApplicationController
  before_action :item_data, only: [:create, :index]
  before_action :check, only: [:index]
  before_action :not, only: [:index]
  before_action :curent, only: [:index]

  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(order_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def item_data
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_purchase).permit(:post_code, :ship_to_region_id, :city, :block, :building,
       :phone_number).merge(item: @item.price, item_id: @item.id, user_id: current_user.id ,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:item],
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def check
     unless user_signed_in?
      redirect_to root_path
    end
  end

  def not
    if @item.purchase
      redirect_to root_path
    end
  end

  def curent
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end
