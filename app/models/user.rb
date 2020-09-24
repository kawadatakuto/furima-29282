class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: { with: PASSWORD_REGEX }

        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
          validates :family_name 
          validates :first_name
        end

        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana can't be blank" } do 
          validates :family_name_kana
          validates :first_name_kana
        end
end
