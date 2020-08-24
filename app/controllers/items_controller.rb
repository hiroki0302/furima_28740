class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:edit, :show, :new]

  def index
    @user = User.new
  end

  # def new
  # end

  # def move_to_new
  #   unless user_signed_in?
  #     redirect_to action: :new
  #   end
  # end

end
