require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "全ての値が正常に存在すれば購入できる" do
    expect(@order).to be_valid
  end

  it "priceが空欄では購入できない" do
    @order.price = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空欄では登録できない" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end
