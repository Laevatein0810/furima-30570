class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true 
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'cannot be registered unless it is a mixture of half-width alphanumeric characters.'}
  validates :password_confirmation, presence: true
  validates :last_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message:'cannot be registered without full-width input.'}
  validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message:'cannot be registered without full-width input.'}
  validates :frigana_last, presence: true
  validates :frigana_first, presence: true
  validates :birthday, presence: true
end
