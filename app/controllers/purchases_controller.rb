class PurchasesController < ApplicationController
  before_action :set_purchases, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @furima_address = FurimaAddress.new
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path 
   end
  end
  
  def create
    @furima_address = FurimaAddress.new(furima_params)
    if @furima_address.valid?
       pay_item
       @furima_address.save
       redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def set_purchases
    @item = Item.find(params[:item_id])
  end
  
  def furima_params
    params.require(:furima_address).permit( :postal_code, :regional_original_delivery_id, :city, :house_number, :building_name, :phone_number, :purchase, :user, :item).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @furima_address = FurimaAddress.new(furima_params)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: furima_params[:token],
      currency: 'jpy'
    )
  end
end