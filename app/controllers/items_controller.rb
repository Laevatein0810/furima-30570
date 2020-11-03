class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new #(create_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end


end
