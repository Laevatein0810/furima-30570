require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    context 'ユーザー情報' do
      it "nicknameが空では登録できない" do
        user = FactoryBot.build(:user)
        user.nickname = ""
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        user = FactoryBot.build(:user)
        user.email = ""
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに一意性が無いと登録できない" do
        user = FactoryBot.create(:user, email: 'aaa@gmail.com')
        another_user = FactoryBot.build(:user, email: 'aaa@gmail.com')
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは、@を含まないと登録できない" do
        user = User.new(nickname: "aaa", email: "aaagmail.com", password: "aaa000", password_confirmation: "aaa000")
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        user = FactoryBot.build(:user)
        user.password = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは６文字以上の入力が無いと登録できない" do
        user = FactoryBot.build(:user)
        user.password = "aaa00"
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数混合での入力で無いと登録できない" do
        user = FactoryBot.build(:user)
        user.password = "aaaaaa"
        user.valid?
        expect(user.errors.full_messages).to include("Password cannot be registered unless it is a mixture of half-width alphanumeric characters.")
      end
      it "passwordは確認用を含め２回入力しないと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "passwordとpassword_confirmation、値が一致しないと登録できない" do
        user = FactoryBot.build(:user)
        user.password_confirmation = "aaaa00"
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context '本人情報確認' do
      it "ユーザー本名は、last_nameが空欄だと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name = ""
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名は、first_nameが空欄だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = ""
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名は、last_nameが全角(漢字・平仮名・カタカナ)での入力が無いと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name = "aiueo"
        user.valid?
        expect(user.errors.full_messages).to include("Last name cannot be registered without full-width input.")
      end
      it "ユーザー本名は、first_nameが全角(漢字・平仮名・カタカナ)での入力が無いと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = "aiueo"
        user.valid?
        expect(user.errors.full_messages).to include("First name cannot be registered without full-width input.")
      end
      it "ユーザー本名のフリガナは、last_nameで空欄だと登録できない" do
        user = FactoryBot.build(:user)
        user.frigana_last = ""
        user.valid?
        expect(user.errors.full_messages).to include("Frigana last can't be blank")
      end
      it "ユーザー本名のフリガナは、first_nameが空欄だと登録できない" do
        user = FactoryBot.build(:user)
        user.frigana_first = ""
        user.valid?
        expect(user.errors.full_messages).to include("Frigana first can't be blank")
      end
      it "ユーザー本名のフリガナは、last_nameで全角カタカナでの入力がないと登録できない" do
        user = FactoryBot.build(:user)
        user.frigana_last = "aiueo"
        user.valid?
        expect(user.errors.full_messages).to include("Frigana last cannot be registered unless last_name is entered in double-byte katakana.")
      end
      it "ユーザー本名のフリガナは、first_nameで全角カタカナでの入力がないと登録できない" do
        user = FactoryBot.build(:user)
        user.frigana_first = "aiueo"
        user.valid?
        expect(user.errors.full_messages).to include("Frigana first cannot be registered unless first_name is entered in double-byte katakana.")
      end
      it "生年月日が未記入だと登録できない" do
        user = FactoryBot.build(:user)
        user.birthday = ""
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

