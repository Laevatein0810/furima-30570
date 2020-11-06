class OrdersController < ApplicationController
  before_action :set_order, only:[:create, :index]

  def index
    return redirect_to root_path if user_signed_in? && current_user.id == @item.user_id || @item.buyer != nil
  end

  def create
    @order = UserDonation.new(order_params)
    if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
  end
  def set_order
    @item = Item.find(params[:item_id])
  end
end
