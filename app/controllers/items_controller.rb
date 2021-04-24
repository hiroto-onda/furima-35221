class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(Item_params)
end

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end