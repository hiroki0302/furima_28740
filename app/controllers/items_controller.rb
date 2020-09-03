class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:edit,:update,:new]
  before_action :item_data, only: [:edit, :update, :show, :destroy]
  before_action :check, only: [:edit, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
     end
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :burden_of_delivery_charge_id, :ship_to_region_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def item_data
    @item = Item.find(params[:id])
  end

  def check
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
