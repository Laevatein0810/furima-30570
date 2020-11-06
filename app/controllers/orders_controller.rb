class OrdersController < ApplicationController
  before_action :set_order, only:[:create, :index]

  def index
  end

  def create
    @order = Order.new(order_params)
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
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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
