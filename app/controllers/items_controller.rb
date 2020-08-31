class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:edit, :show, :new]

  def index
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def move_to_new
    unless user_signed_in?
      redirect_to action: :new
    end
  end

 

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :burden_of_delivery_charge_id, :ship_to_region_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
