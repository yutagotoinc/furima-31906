class User < ApplicationRecord

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :email, uniqueness: { case_sensitive: true }

  VALID_BUYER_NAME_REGEX = /\A[ぁ-んァ-ヶー一-龠]+\z/
  validates_format_of :first_name, with: VALID_BUYER_NAME_REGEX
  validates_format_of :last_name, with: VALID_BUYER_NAME_REGEX

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
