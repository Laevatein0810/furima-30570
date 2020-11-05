class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
    #redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item.update(update_params)
    redirect_to root_path
  end

  def destroy
    @item.destroy
      if @item.destroy
        redirect_to root_path
      end
      unless user_signed_in? && current_user.id == @item.user.id
        render :new
      end
  end

  private
  def create_params
    params.require(:item).permit(:name, :description, :status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :category_id, :price, :image).merge(user_id: current_user.id)
  end

    def update_params
      params.require(:item).permit(:name, :description, :status_id, :delivery_charge_id, :prefecture_id, :shipping_days_id, :category_id, :price, :image).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
