class PurchasesController < ApplicationController
  def index
    @furima_address = FurimaAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @furima_address = FurimaAddress.new(furima_params)
    if @furima_address.valid?
       @furima_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def furima_params
    params.require(:furima_address).permit( :postal_code, :regional_original_delivery_id, :city, :house_number, :building_name, :phone_number, :purchase, :user, :item).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end