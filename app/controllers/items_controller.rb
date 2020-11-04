class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new (create_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  private
  def create_params
    params.require(:item).permit(:name, :description, :status_id, :delivery_charge_id, :prefectures_id, :shipping_days_id, :category_id, :price, :image).merge(user_id: current_user.id)
  end


end
