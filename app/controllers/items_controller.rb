class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: :index
  before_action :authenticate_user!, only: [:new, :create]

  def index
    #@items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:product, :image, :product_description , :category_id, :product_state_id, :delivery_charge_burden_id, :regional_original_delivery_id, :days_up_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end