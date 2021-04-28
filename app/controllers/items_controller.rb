class ItemsController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def edit
  end


  def update
     @item = Item.find(params[:id])
     if   @item.update(item_params)
       redirect_to item_path
    else
       render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private

  def set_prototype
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product, :image, :product_description , :category_id, :product_state_id, :delivery_charge_burden_id, :regional_original_delivery_id, :days_up_to_delivery_id, :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end