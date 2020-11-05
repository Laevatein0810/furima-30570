class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item
  has_many :buyer

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'cannot be registered unless it is a mixture of half-width alphanumeric characters.'}
    validates :password_confirmation
    validates :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message:'cannot be registered without full-width input.'}
    validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message:'cannot be registered without full-width input.'}
    validates :frigana_last, format: { with: /\A[ァ-ヶー－]+\z/, message: 'cannot be registered unless last_name is entered in double-byte katakana.'}
    validates :frigana_first, format: { with: /\A[ァ-ヶー－]+\z/, message: 'cannot be registered unless first_name is entered in double-byte katakana.'}
    validates :birthday
  end
end
