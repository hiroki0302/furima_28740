class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:edit, :new]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
   @item = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :burden_of_delivery_charge_id, :ship_to_region_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
