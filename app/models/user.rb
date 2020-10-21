class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "You can't register without @ in the email" } do
    validates :email
  end

  validates :nickname, :birth_day, presence: true
end
