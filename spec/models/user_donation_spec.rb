require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  before do
    @donation = FactoryBot.build(:UserDonation)
  end

  describe '商品購入機能' do
    context '商品が購入できる' do
      it "全ての値が正常に存在すれば購入できる" do
        expect(@donation).to be_valid
      end
    end

    context '商品が購入できない' do

      it "tokenが空欄では購入できない" do
        @donation.token = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空欄では購入できない" do
        @donation.postal_code = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeは「-」が無いと購入できない" do
        @donation.postal_code = "1234567"
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Postal code is invalid")
      end

      it "cityが空欄では購入できない" do
        @donation.city = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空欄では購入できない" do
        @donation.address = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空欄では購入できない" do
        @donation.phone_number = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが12桁以上では購入できない" do
        @donation.phone_number = "090123456789"
        @donation.valid?
      end

      it "prefectureが空欄では購入できない" do
        @donation.prefecture_id = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Prefecture is not a number")
      end

      it "prefectureが「---」では購入できない" do
        @donation.prefecture_id = "1"
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Prefecture must be other than 1")
      end
    end
  end
end
