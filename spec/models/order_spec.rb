require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品が購入できる' do
      it "全ての値が正常に存在すれば購入できる" do
        expect(@order).to be_valid
      end
    end

    context '商品が購入できない' do

      it "tokenが空欄では購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空欄では購入できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "cityが空欄では購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空欄では購入できない" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空欄では購入できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "prefectureが空欄では購入できない" do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture is not a number")
      end
    end
  end
end
